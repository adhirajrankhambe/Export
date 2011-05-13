class CreateImportDatas < ActiveRecord::Migration
  def self.up
    create_table :import_datas do |t|
      t.text :data
      t.integer :import_id

      t.timestamps
    end
  end

  def self.down
    drop_table :import_datas
  end
end
