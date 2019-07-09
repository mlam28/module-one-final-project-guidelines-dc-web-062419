class CreatePetSkills < ActiveRecord::Migration[4.2]

    def change
        create_table :pet_skills do |t|
            t.integer :skill_id
            t.integer :pet_id
        end
    end

end