module ChaptersHelper

  def add_tag_to_chapter(chapter_id, tag_string)
    # adds tags to a chapter either one at a time
    # or multiple tags as a string divided by commas
    # all tags are downcased to avoid search difficulties
    tag_string.downcase!
    chapter = Chapter.find(chapter_id)
    chapter.tag_list.add(tag_string, parse: true)
    chapter.save
  end

  def remove_tag_from_chapter(chapter_id, tag_string)
    # removes tags from a chapter one at a time
    tag_string.downcase!
    chapter = Chapter.find(chapter_id)
    chapter.tag_list.remove(tag_string)
    chapter.save
  end

  def self.find_chapter_by_tag(tag_string)
    # returns a list of all chapters containing the chosen tag or tags
    Chapter.tagged_with([tag_string])
  end

  def self.find_chapter_by_user(user_id)
    # returns a list of all chapters
    # assigned to one or more of this user's sagas
    Chapter.where(:saga_id => Saga.where(:user_id => user_id))
  end

  def self.find_user_by_chapter(chapter_id)
    # returns a list of all users
    # with one or more sagas containing this chapter
    User.find(Saga.find(Chapter.find(chapter_id).saga_id).user_id)
  end

  def self.find_by_category(category)
    # returns all chapters with category
    Chapter.where(category: category)
  end

  def self.all_tags
    # returns a list of the 50 most frequently used tags
    # in descending order
    ActsAsTaggableOn::Tag.most_used
  end

  def self.find_user_by_tag(tag_string)
    tag_chapters = self.find_chapter_by_tag(tag_string)
    tag_users = tag_chapters.map do |chapter|
      self.find_user_by_chapter(chapter[:id])
    end
  end

end

# require './app/helpers/chapters_helper'
# include (ChaptersHelper)
