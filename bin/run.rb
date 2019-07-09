require_relative '../config/environment'
require "pry"

def greeting
    puts "Welcome to Tamagotchi pets!  Please enter your name."
    # name = gets.chomp
    # user = User.find_by(name: "#{name}") 
        # if user == nil
        #     new_user = User.create_user(name)
        #     "You are about to become a pet owner! Congrats, #{name}!"
        # else 
        #     "Welcome back, #{user.name}"
end

def user_name(name)
    User.create(name: "#{name}")
end


def create_pet(user)
    puts "If you would like to create a pet, please enter a name for your new companion."
    pet_name = gets.chomp
    pet = Pet.create(name: "#{pet_name}", hunger: 25, happiness: 25, user_id: user.id)
    puts "Congrats! You are now the owner of #{pet_name}!"
end





def run
    greeting
    name = gets.chomp
    user_name(name)
    user = User.find_by(name: "#{name}")
    create_pet(user)
    pet = Pet.find_pet_by_user(user)
end

run


