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
    puts "Please enter a name for your new companion."
    pet_name = gets.chomp.capitalize
    pet = Pet.create(name: "#{pet_name}", hunger: 25, happiness: 25, user_id: user.id)
    puts "Congrats! You are now the owner of #{pet_name}!"
end

def locate_or_create_pet(user)
        if Pet.find_pet_by_user(user).nil?
                create_pet(user)
        else
                pet = Pet.find_pet_by_user(user)
                puts "#{pet.name} has missed you!"
        end
        

end

def instructions
        puts "Enter the number corresponding to the action you would like to perform?"
        puts "1. Pet Status"
        puts "2. Feed"
        puts "3. Play"
        puts "4. Skills and Level Status"
        puts "5. Exit game."
end

def exit
 puts "Goodbye!"
 true
end

def game_options(user)
        input = validate_input
        if input == "1"
                pet_status(user.pet)
        elsif input == "2"
                user.pet.feed
        elsif input == "3"
                user.pet.play
        elsif input == "4"
                print_all_skills(user)
                print_skill_level(user)
        elsif input == "5"
                exit
        else
        "Please enter a valid command."
        end
end


def print_all_skills(user)
        last = user.list_skills.pop
       if user.find_pet_skills.nil?
        puts "You currently have no skills."
       #binding.pry
       elsif user.list_skills.length < 1 
        puts "You currently have no skills."
       elsif user.list_skills.length == 1
        puts "Skills: #{user.list_skills[0]}."
       elsif user.list_skills.length == 2
        puts "Skills: #{user.list_skills.join(" and ")}."
       else
        puts "Skills: #{user.list_skills[0...-1].join(", ")}, and #{last}."
        end
end

def redirect(user)
        instructions
        new_input = gets.chomp
        game_options(new_input, user)
end


def  print_skill_level(user)
       level = user.find_highest_skill
       if level.nil?
        game_options(user)
       else
      highest_skill_name = Skill.find_by(id: level).name
        puts "You are currently at level #{level}, #{highest_skill_name}, out of 5 levels."
        instructions
        game_options(user)
       end
       
end

def pet_status(pet)
        puts "Name: #{pet.name }"
        puts "Happiness: #{pet.happiness}"
        puts "Hunger: #{pet.hunger}"
        instructions
        game_options(pet.user)
end

def validate_input
        input = gets.chomp
        while !(1..5).include?(input.to_i)
                puts "Please Enter a Valid Option"
                input = gets.chomp
        end
        input
end


def run
    greeting
    input = gets.chomp.capitalize
   # binding.pry
    user = User.find_by(name: "#{input}")
    if user != nil
     puts "Welcome back, #{user.name}"
     locate_or_create_pet(user)
     instructions
     game_options(user)
    end
    if user == nil
     puts "Type yes to confirm the name #{input}, or input a new name. 'exit' to exit."
        #confirm = gets.chomp
        #validate_name(confirm)
      user = correct(input)
      locate_or_create_pet(user)
       instructions
       game_options(user)
#       end
    end
    #name = gets.chomp
    
    #pet = Pet.find_pet_by_user(user) #might be able to delete this if redundant
#     instructions
#     game_options(user)
end




def validate_name
        confirm = gets.chomp
        while !["yes", "exit"].include?(confirm)
                puts "Type yes to confirm #{confirm}. 'exit' to exit."
                confirm = gets.chomp
        end
        confirm
end

def correct(input)
        confirm = validate_name
        if confirm == "yes"
              User.create(name: "#{input}")

        elsif confirm == "exit"
                exit
        end
        User.find_by(name: "#{input}")
end
run

