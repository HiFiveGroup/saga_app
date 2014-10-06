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
    # returns an array of all chapters containing the chosen tag or tags
    tag_chapters = Chapter.tagged_with([tag_string])
    tag_chapters_array = tag_chapters.map { |chapter| chapter }
  end

  def self.find_chapter_by_user(user_id)
    # returns an array of all chapters
    # assigned to one or more of this user's sagas
    user_chapter = Chapter.where(:saga_id => Saga.where(:user_id => user_id))
    user_chapter_array = user_chapter.map { |chapter| chapter }
  end

  def self.find_user_by_chapter(chapter_id)
    # returns the user with this chapter
    # POSSIBLE ERROR: if chapter not found, cannot make this return 'nil'
    user = User.find(Saga.find(Chapter.find(chapter_id).saga_id).user_id)
  end

  def self.all_tags
    # returns an array of the 50 most frequently used tags in descending order
    aata_list = ActsAsTaggableOn::Tag.most_used
    all_tags_array = aata_list.map { |tag| tag.name }
  end

  def self.find_user_by_tag(tag_string)
    # this returns an array of user records who have used this single tag, or nil
    tag_chapters = self.find_chapter_by_tag(tag_string)
    unless tag_chapters.empty?
      tag_users = tag_chapters.map do |chapter|
        self.find_user_by_chapter(chapter[:id])
      end
      tag_users.uniq
    end
  end

  def self.find_tag_by_user(user_id)
    # this returns an array of tags belonging to a user id, or empty array
    user_chapters = self.find_chapter_by_user(user_id)
    user_tags = user_chapters.map { |chapter| chapter.tag_list }
    unless user_tags.empty?
      user_tags.flatten!.uniq!
    end
    user_tags
  end

  def self.find_chapter_by_category(category)
    # returns all chapters with category, or empty array
    category_chapter = Chapter.where(category: category.downcase)
    category_chapter_array = category_chapter.map { |chapter| chapter }
  end

  def self.find_similar_users(user_id)
    # returns all other users who share any tags with current user
    user_tags = self.find_tag_by_user(user_id).flatten.uniq
    unless user_tags.empty?
      users = user_tags.map do |user_tag|
        self.find_user_by_tag(user_tag)
      end
      other_users = users.flatten.compact.uniq
      other_users.delete_if { |user| user.id == user_id }
      other_users
    end
  end

end
