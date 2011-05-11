class Import < ActiveRecord::Base
  has_dynamic_attributes :column_name => :data
end
