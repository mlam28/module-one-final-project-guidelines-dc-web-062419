require_relative '../config/environment'
require "pry"
require 'artii'


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
        puts "1. Pet Status"
        puts "2. Feed"
        puts "3. Play"
        puts "4. Skills and Level Status"
        puts "5. Exit game."
end

def exit
 puts "Goodbye!"
end

def game_options(user)
        prompt = TTY::Prompt.new
        # binding.pry
        input = prompt.select("Please select the action you would like to perform. ", %w(Pet-Status Feed Play Skills&Level Exit ))
        if input == "Pet-Status"
                pet_status(user.pet)
        elsif input == "Feed"
                user.pet.feed
        elsif input == "Play"
                user.pet.play
        elsif input == "Skills&Level"
                print_all_skills(user)
                print_skill_level(user)
        elsif input == "Exit"
                exit
        else
        "Please enter a valid command."
        end
end


def print_all_skills(user)
       last = user.list_skills.pop
       if user.list_skills.length < 1
        puts "You currently have no skills."
       elsif user.list_skills.length == 1
        puts "Skills: #{user.list_skills[0]}."
       elsif user.list_skills.length == 2
        puts "Skills: #{user.list_skills.join(" and ")}."
       else
        puts "Skills: #{user.list_skills[0...-1].join(", ")}, and #{last}."
        end
end

def  print_skill_level(user)
       level = user.find_highest_skill
      highest_skill_name = Skill.find_by(id: level).name
        puts "You are currently at level #{level}, #{highest_skill_name}, out of 5 levels."
        game_options(input, user)
        # puts "If you would like a chance to level up, type #{level += 1} to play quiz."
        # puts "Type 'menu' to return to menu options, or 'exit' to exit out of the game." 
#        loop do 
#         input = gets.chomp
#         break if input == "menu" || input == "exit" || input == 1 || 2 || 3 || 4 || 5
#                 if input == "menu"
#                 instructions
#                 new_input = gets.chomp.to_i
#                 game_options(new_input, user)
#                 elsif input == "exit"
#                         exit
#                 elsif input == 1 || 2 || `3 || 4 || 5
#                         "go to game"
#                 end
        # break if input == "exit"
        #         exit
        #         break
        # elsif input == 1 || 2 || 3 || 4 || 5
        #        puts "number ranges work"
        #        break
        #        puts "it ended"
        # else
        #         puts "Please enter a valid command."
        # end
        # end
end

def pet_status(pet)
        puts "Name: #{pet.name }"
        puts "Happiness: #{pet.happiness}"
        puts "Hunger: #{pet.hunger}"
        game_options(pet.user)
end




def run

    greeting
    name = gets.chomp
    user = User.find_or_create_by(name: "#{name}")
    locate_or_create_pet(user)
    pet = Pet.find_pet_by_user(user) #might be able to delete this if redundant
   # binding.pry
#     instructions
#     input = gets.chomp
    #binding.pry
    game_options(user)
end

# prompt = TTY::Prompt.new
# a = prompt.select("Choose your destiny?", %w(Scorpion Kano Jax))
# if a == "Jax"
#         puts "Hello"
# end
a = Artii::Base.new :font => 'big'
puts Rainbow(a.asciify('Tamagotchi Pets')).blue.bright.blink
run


# def game_instructions_options
# while input
#         input = gets.chomp
#         instructions

# end
