class Pet_Skill < ActiveRecord::Base
    belongs_to :pet 
    belongs_to :skill
end