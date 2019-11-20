class ProcessingResult < ApplicationRecord
    has_one_attached :file
    belongs_to :processing_script
    belongs_to :input_file
end 
