class AddStdErrToProcessingResult < ActiveRecord::Migration[5.2]
  def change
    add_column :processing_results, :std_err, :string
    add_column :processing_results, :exit_code, :integer
  end
end
