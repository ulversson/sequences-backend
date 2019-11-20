class RemoveFileColumn < ActiveRecord::Migration[5.2]
  def change
    remove_column :processing_results, :file, :string
  end
end
