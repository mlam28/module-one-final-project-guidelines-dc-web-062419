class CreatePets < ActiveRecord::Migration[4.2]
    def change
        create_table :pets do |t|
        t.string :name
        t.integer :hunger
        t.integer :happiness
        t.integer :user_id
        end
    end


end