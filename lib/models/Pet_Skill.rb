class PetSkill < ActiveRecord::Base
    belongs_to :pet 
    belongs_to :skill
end