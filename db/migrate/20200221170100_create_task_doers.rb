class CreateTaskDoers < ActiveRecord::Migration[6.0]
  def change
    create_table :task_doers do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.text :about

      t.timestamps
    end
  end
end
