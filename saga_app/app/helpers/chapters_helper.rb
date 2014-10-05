module ChaptersHelper

  def self.find_by_category(category)
    # this method returns all chapters with category
    category_chapters = Chapter.where(category: category)
  end

  def add_tag_to_chapter(chapter_id, tag_string)
    # this method adds tags to a chapter
    # either one at a time or multiple tags as a string divided by commas
    # all tags are downcased to avoid search difficulties
    tag_string.downcase!
    chapter = Chapter.find(chapter_id)
    chapter.tag_list.add(tag_string, parse: true)
    chapter.save
  end

  def remove_tag_from_chapter(chapter_id, tag_string)
    # this method removes tags from a chapter one at a time
    tag_string.downcase!
    chapter = Chapter.find(chapter_id)
    chapter.tag_list.remove(tag_string)
    chapter.save
  end

  def self.find_by_tag(tag_string)
    # this returns a list of all chapters containing the chosen tag or tags
    Chapter.tagged_with([tag_string])
  end

  def self.all_tags
    # this returns a list of all tags, descending by usage frequency
    ActsAsTaggableOn::Tag.most_used
  end

end

# require './app/helpers/chapters_helper'
# include (ChaptersHelper)
