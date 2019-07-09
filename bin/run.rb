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

# def user_name(name)
#     User.create(name: "#{name}")
# end


def create_pet(user)
    puts "If you would like to create a pet, please enter a name for your new companion."
    pet_name = gets.chomp
    pet = Pet.create(name: "#{pet_name}", hunger: 25, happiness: 25, user_id: user.id)
    puts "Congrats! You are now the owner of #{pet_name}!"
end

def locate_or_create_pet(user)
        if Pet.find_pet_by_user(user).nil?
                create_pet(user)
        else
                pet = Pet.find_pet_by_user(user)
                puts "Welcome back, #{user.name}. #{pet.name} has missed you!"
        end
        

end

def instructions
        puts "Enter the number corresponding to the action you would to perform?"
        puts "1. Stats"
        puts "2. Feed"
        puts "3. Play"
end

def game_options(input)
        if input == 1
                puts ""

        
end

def print_skill_level
end

def pet_status(pet)
        puts "Name: #{pet.name }"
        puts "Happiness: #{pet.happiness}"
        puts "Hunger: #{pet.hunger}"
end




def run
    greeting
    name = gets.chomp
    user = User.find_or_create_by(name: "#{name}")
    locate_or_create_pet(user)
    pet = Pet.find_by(name: "#{user.name}")
    instructions
    input = gets.chomp
    game_options(input)
end

run


