class RenameTagsColumnToTagList < ActiveRecord::Migration
  def change
    rename_column :chapters, :tags, :tag_list
  end
end
