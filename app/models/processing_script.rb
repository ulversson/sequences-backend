class ProcessingScript < ApplicationRecord
  has_one_attached :file

  has_many :processing_results
  
  scope :active, -> { where(active: true) }

  def file_on_disk
    ActiveStorage::Blob.service.send(:path_for, file.key)
  end  
end
