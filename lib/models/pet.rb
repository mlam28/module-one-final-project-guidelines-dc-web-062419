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
      self.find_pet_skills(user).map do |pet_skill|
        pet_skill.skill_name
    end
  end

    def feed
      current_hunger = self.hunger
      current_happiness = self.happiness
      new_hunger = current_hunger += 5
      new_happiness = current_happiness += 5
     
      if new_hunger > 25
        self.hunger = 25
      elsif new_hunger += 5 <= 25
        self.hunger += 5
      end
      if new_happiness > 25
        self.happiness = 25
      elsif new_happiness <= 25
        self.happiness += 5
      end
      puts "Your pet has been fed! Its hunger level is currently #{self.hunger} and happiness is #{self.happiness}"
      instructions
      input = gets.chomp
      game_options(input, self.user)
    end

    def make_hungry

    end

    def play
      
    end

    
end