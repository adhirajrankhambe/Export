class Import < ActiveRecord::Base
  has_attached_file :source
  has_many :import_datas
end
