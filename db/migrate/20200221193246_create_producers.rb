class CreateProducers < ActiveRecord::Migration[6.0]
  def change
    create_table :producers do |t|
      t.string :email
      t.string :password_digest
      t.string :name
      t.text :about
      t.date :dob

      t.timestamps
    end
  end
end
