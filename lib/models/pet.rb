require "pry"
class Pet < ActiveRecord::Base
    belongs_to :user
    has_many :pet_skills
    has_many :skills, through: :pet_skills

    def self.find_pet_by_user(user)
       Pet.find_by(user_id: user.id)
    end
    
    def self.find_pet_skills(user)
      pet =  self.find_pet_by_user(user)
      pet.pet_skills
    end

    def self.find_skill_ids(user)
      skill_ids = self.find_pet_skills(user).map do |pet_skill|
      pet_skill.skill_id  
      end
      skill_ids.each do |id|
      PetSkill.all.select do |pet_skill|
         pet_skill.skill_id == id
        end
      end
    end
end