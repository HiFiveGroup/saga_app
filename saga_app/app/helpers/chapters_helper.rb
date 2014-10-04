module ChaptersHelper

  def chapters_by_category

  end

  def add_tag(chapter_id, tag_string)
    # this method can add either one tag at a time
    # or multiple tags as a string divided by commas
    chapter = Chapter.find(chapter_id)
    chapter.tag_list.add(tag_string, parse: true)
    chapter.save
  end

end

# require './app/helpers/chapters_helper'
# include (ChaptersHelper)
