module ChaptersHelper

  def self.chapters_by_category(category)
    category_chapters = Chapter.where(category: category)
  end

  def add_tag(chapter_id, tag_string)
    # this method can add either one tag at a time
    # or multiple tags as a string divided by commas
    # also all tags are downcased to avoid search difficulties
    chapter = Chapter.find(chapter_id)
    chapter.tag_list.add(tag_string.downcase, parse: true)
    chapter.save
    chapter.reload
  end

  def remove_tag(chapter_id, tag_string)
    # this method can only remove tags one at a time
    chapter = Chapter.find(chapter_id)
    chapter.tag_list.remove(tag_string.downcase)
    chapter.save
    chapter.reload
  end

  def self.chapters_with_tag(tag_string)
    Chapter.tagged_with([tag_string])
  end

end

# require './app/helpers/chapters_helper'
# include (ChaptersHelper)
