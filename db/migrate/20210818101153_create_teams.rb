class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :age_group
      t.string :coach

      t.timestamps
    end
  end
end
