module ChaptersHelper

  def add_tag(chapter_id, tag_string)
    chapter = Chapter.find(chapter_id)
    chapter.tag_list.add(tag_string)
  end

end
