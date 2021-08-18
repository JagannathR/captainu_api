class CreateNotes < ActiveRecord::Migration[6.1]
  def change
    create_table :notes do |t|
      t.references :user, null: false, foreign_key: true
      t.string :note
      t.references :assessment, null: false, foreign_key: true

      t.timestamps
    end
  end
end
