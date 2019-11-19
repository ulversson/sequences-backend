class CreateInputFiles < ActiveRecord::Migration[5.2]
  def change
    create_table :input_files do |t|
      t.string :file

      t.timestamps
    end
  end
end
