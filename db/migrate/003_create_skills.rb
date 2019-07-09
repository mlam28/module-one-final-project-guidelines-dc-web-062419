class CreateSkills < ActiveRecord::Migration[4.2]

    def change
        create_table :skills do |t|
            t.string :skill
        end
    end

end