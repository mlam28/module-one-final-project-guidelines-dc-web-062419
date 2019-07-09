require "pry"
class User < ActiveRecord::Base
    has_many :pets
    has_many :skills, through: :pets
    
    def self.create_user(name)
        User.create(name: "#{name}") 
    end

  

    def self.delete_all
        self.delete_all
    end

    
end