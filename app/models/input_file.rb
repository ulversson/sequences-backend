class InputFile < ApplicationRecord
  has_one_attached :file

  validates :file, presence: true

  def file_on_disk
    ActiveStorage::Blob.service.send(:path_for, file.key)
  end
end
