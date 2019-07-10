require "pry"
class Pet < ActiveRecord::Base
    belongs_to :user
    has_many :pet_skills
    has_many :skills, through: :pet_skills

    def self.find_pet_by_user(user)   #class method to find pet by user instance
       Pet.find_by(user_id: user.id)
    end
    
    def self.find_pet_skills(user)     #uses above method to find pet skills by passing in user instance
      user.pet.pet_skills
    end

    def self.list_pet_skills(user)
      user.find_pet_skills.map do |pet_skill|
        pet_skill.skill_name
    end
  end

    
    
end