class Pet < ActiveRecord::Base
    belongs_to :user

    def self.find_pet_by_user(user)
        Pet.find_by(user_id: user.id)
    end
end