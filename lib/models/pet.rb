class Pet < ActiveRecord::Base
    belongs_to :user
    has_many :pet_skills
    has_many :skills, through: :pet_skills

    def self.find_pet_by_user(user)
        Pet.find_by(user_id: user.id)
    end

    def self.find_pet_skills(user)
      pet =  self.find_pet_by_user(user)
      pet.skills
    end
end