module ChaptersHelper

  def add_tag(chapter_id, tag_string)
    # this method can add either one tag at a time
    # or multiple tags as a string divided by commas
    chapter = Chapter.find(chapter_id)
    chapter.tag_list.add(tag_string)
  end

end
