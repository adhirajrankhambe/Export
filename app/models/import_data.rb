class ImportData < ActiveRecord::Base
  has_dynamic_attributes :column_name => :data
  belongs_to :import
end
