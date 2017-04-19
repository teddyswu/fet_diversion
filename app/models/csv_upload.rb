class CsvUpload < ActiveRecord::Base
	mount_uploader :file, CsvUploader

  validates :file, presence: true
end
