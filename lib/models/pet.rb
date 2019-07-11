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

  def add_pet_skill(user, skill)
    PetSkill.create(skill_id: skill.id, skill_name: skill.name, pet_id: self.id)
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
      game_options(self.user)
    end

    def make_hungry
      self.hunger -= 5
      self.die?
    end

    def make_unhappy
      self.happiness -= 5
      self.die?
    end

    def play
      Question1.start_quiz1
    end

    def die?
      if self.happiness < 0 || self.hunger < 0
        self.delete
        puts "Your pet has died due to hunger or depression."
        exit
      end
      puts "Your current hunger level is #{self.hunger}, happiness is #{self.happiness}."
    end
    
end