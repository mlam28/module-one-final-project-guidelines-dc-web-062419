require "pry"
class User < ActiveRecord::Base
    has_one :pet
    has_many :skills, through: :pet
    
    def self.create_user(name)
        User.create(name: "#{name}") 
    end

    def find_pet
        user.pet
    end

    def find_pet_skills
        user.pet.find_pet_skills 
    end

    def list_skills
        self.find_pet_skills.map do |pet_skill|
            pet_skill.skill_name
        end
    end

    def self.delete_all
        self.delete_all
    end

    
end