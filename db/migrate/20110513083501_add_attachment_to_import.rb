class AddAttachmentToImport < ActiveRecord::Migration
  def self.up
    add_column :imports, :source_file_name,    :string
    add_column :imports, :source_content_type, :string
    add_column :imports, :source_file_size,    :integer
    add_column :imports, :source_updated_at,   :datetime
  end

  def self.down
    remove_column :imports, :source_file_name
    remove_column :imports, :source_content_type
    remove_column :imports, :source_file_size
    remove_column :imports, :source_updated_at
  end
end
