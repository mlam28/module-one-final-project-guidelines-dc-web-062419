class CreatePets < ActiveRecord::Migration[5.0]
  def change
    create_table :pets do |t|
      t.string :name
      t.integer :hunger
      t.integer :happiness
      t.integer :user_id
      end
  end
end
