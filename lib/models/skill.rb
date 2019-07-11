class Skill < ActiveRecord::Base
    has_many :pet_skills
    has_many :pets, through: :pet_skills

    # def self.delete_all
    #     self.delete_all
    # end
end