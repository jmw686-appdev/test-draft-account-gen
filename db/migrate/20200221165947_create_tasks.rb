class CreateTasks < ActiveRecord::Migration[6.0]
  def change
    create_table :tasks do |t|
      t.string :name
      t.integer :duration
      t.boolean :completed
      t.text :description

      t.timestamps
    end
  end
end
