class Question < ActiveRecord::Base
  

#binding.pry
    def self.start_quiz(user)
    #   user.pet.make_hungry
    #   user.pet.make_unhappy
    #  if user.pet.die? == true
    #     return
      if user.find_highest_skill.nil?
         level = 1
      else
        level = user.find_highest_skill + 1
      end
      # binding.pry
        answer = ""
        score = 0
        count = 0
        questions = []
          self.all.each do |question|
            if question.difficulty == level 
              puts question.question 
              questions << question
              loop do
                answer = gets.chomp
                #count += 1
                break if answer == "a" || answer == "b" || answer == "c"
                puts "Enter a valid input"
              end
               if answer == question.answer
                    score += 1
                end
          end
            end  
            # binding.pry

            


            
        if score == count 
          puts "You got #{score} out of #{count} right! #{user.pet.name} has leveled up to Level #{level}!"
          #binding.pry
          user.pet.level_up(level)
          instructions
          game_options(user)
        else
          user.pet.make_unhappy
          user.pet.make_hungry
          if user.pet.die? != false
          #binding.pry
          puts "You scored #{score} out of #{questions.length} questions right. Unfortunately, you did not reach the next level. Would you like to try again?"
          puts "Enter yes if you would like to play again, else you will be returned to the main menu"
          input=gets.chomp
          if input == "yes"
           self.start_quiz(user)
          else 
            puts "returning to main menu"
            instructions
            game_options(user)
          end
        end
      end
    end

    
end

# p1 = "1) What animal has the longest lifespan?\n(a) Elephant\n(b)Whale\n(c)Giant Tortoise"
# p2 = "2) What is the only mammal capable of true flight??\n(a) Bat\n(b)Flying Squirrel\n(c)Hummingbird"

# questions = [
#     Question1.new(p1, "c"),
#     Question1.new(p2, "b")
# ]
#binding.pry









