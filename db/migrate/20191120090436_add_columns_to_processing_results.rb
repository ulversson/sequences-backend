class AddColumnsToProcessingResults < ActiveRecord::Migration[5.2]
  def change
    add_column :processing_results, :input_file_id, :integer
  end
end
