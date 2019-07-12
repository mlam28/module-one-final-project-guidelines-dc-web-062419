require_relative '../config/environment'
require "pry"
require 'artii'
require 'rainbow'



def greeting
    puts "Welcome to Tamagotchi pets!  Please enter your name."
end

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
                puts Rainbow("#{pet.name} has missed you!").underline.blue.bold
        end
end    

<<<<<<< HEAD
=======
# def instructions
#         puts "Enter the number corresponding to the action you would to perform?"
#         puts "1. Pet Status"
#         puts "2. Feed"
#         puts "3. Play"
#         puts "4. Skills and Level Status"
#         puts "5. Exit game."
# end

>>>>>>> User-experience
def exit
        goodbye = Artii::Base.new :font => 'big'
        puts Rainbow(goodbye.asciify('Goodbye')).orange.bright.blink
 true
end

def game_options(user)
        prompt = TTY::Prompt.new
<<<<<<< HEAD
=======
        # binding.pry
        puts ""
>>>>>>> User-experience
        input = prompt.select("Please select the action you would like to perform.", %w(Pet-Status Feed Play Skills&Level Exit ))
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
        end
end



def print_all_skills(user)
        last = user.list_skills.pop
       if user.find_pet_skills.nil?
        puts "You currently have no skills."
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




 def  print_skill_level(user)
        level = user.find_highest_skill
        if level.nil?
         game_options(user)
        else
       highest_skill_name = Skill.find_by(id: level).name
         puts "You are currently at level #{level}, #{highest_skill_name}, out of 5 levels."
<<<<<<< HEAD
    
=======
        #  instructions
>>>>>>> User-experience
         game_options(user)
        end
  
  end



def pet_status(pet)
pikachu = <<-HEREDOC
      _._
   .-'66||        ,;'
  (O  ,:|/.----..;'
   `=' \_  ____  |
        |||   |||
        |||   |||
        mm'   mm'
  
HEREDOC
        puts Rainbow(pikachu).blue.bright
        puts ""
        puts "Name: #{Rainbow(pet.name).bold.bright.blue }"
        puts "Happiness: #{Rainbow(pet.happiness).bold.bright.blue}"
        puts "Hunger: #{Rainbow(pet.hunger).bold.bright.blue}"
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

 def validate_name(input)
        array = []
        array << input
        confirm = ""
        while !["yes", "exit"].include?(confirm)
                puts "Type yes to confirm #{array[-1].capitalize}, or enter a new name. 'exit' to exit."
                confirm = gets.chomp
                array << confirm
        end
        array
       
        if confirm.downcase == "yes"
              
                User.find_or_create_by(name: "#{array[-2].capitalize}")
               
        elsif confirm == "exit"
                  exit
          end
          User.find_by(name: "#{array[-2].capitalize}")
end
 
#  def correct(input)
#         confirm = validate_name
#         #binding.pry
#         if confirm.downcase == "yes"
#               User.find_or_create_by(name: "#{input}")
#         elsif confirm == "exit"
#                 exit
#         end
#         User.find_by(name: "#{input}")
#  end


def run
        greeting
        input = gets.chomp.capitalize
        if input.downcase == 'exit'
                exit
                return
        end
        user = User.find_by(name: "#{input}")
        if user != nil
         puts Rainbow("Welcome back, #{user.name}").italic
        puts "---------------------------------"
         locate_or_create_pet(user)
         game_options(user)
        end
        if user == nil
          user =  validate_name(input)
           locate_or_create_pet(user)
            game_options(user)
        end
     end

<<<<<<< HEAD

  
     
=======
>>>>>>> User-experience


# puts Rainbow(pikachu).red  
a = Artii::Base.new :font => 'big'
puts Rainbow(a.asciify('Tamagotchi Pets')).blue.bright.blink
run


