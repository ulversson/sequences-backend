class CreateProcessingResults < ActiveRecord::Migration[5.2]
  def change
    create_table :processing_results do |t|
      t.string :file
      t.text :output
      t.integer :processing_script_id
      t.timestamps
    end
  end
end
