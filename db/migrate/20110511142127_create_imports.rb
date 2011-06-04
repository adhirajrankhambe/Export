class CreateImports < ActiveRecord::Migration
  def self.up
    create_table :imports do |t|
      t.string :parse_status
      t.text :data_attributes

      t.timestamps
    end
  end

  def self.down
    drop_table :imports
  end
end
