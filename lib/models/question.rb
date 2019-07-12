class Question < ActiveRecord::Base
  

    def self.start_quiz(user)
      if user.find_highest_skill.nil?
         level = 1
         
      else
        level = user.find_highest_skill + 1
      end
     
        answer = ""
        score = 0
        count = 0
        questions = []
          self.all.each do |question|
            if question.difficulty == level 
              puts Rainbow("Enter the letter that matches your choice.").italic.red
              puts Rainbow(question.question).bold
              questions << question
              loop do
                answer = gets.chomp.downcase
                break if answer == "a" || answer == "b" || answer == "c"
                puts "Enter a valid input"
              end
               if answer == question.answer
                    score += 1
                end
          end
            end  
           

            


            
        if score == questions.length 
          puts "You got #{score} out of #{questions.length} right! #{user.pet.name} has leveled up to Level #{level}!"
          user.pet.level_up(level)
          user.pet.make_unhappy
          user.pet.make_hungry
          if user.pet.die? == true
            return
          end
          # instructions
          game_options(user)
        else
          user.pet.make_unhappy
          user.pet.make_hungry
          if user.pet.die? == true
            return
          end
          puts "You scored #{score} out of #{questions.length} questions right. Unfortunately, you did not reach the next level. Would you like to try again?"
          puts "Enter yes if you would like to play again, else you will be returned to the main menu"
          input=gets.chomp
          if input == "yes"
           self.start_quiz(user)
          else 
            puts "returning to main menu"
            # instructions
            game_options(user)
          end
        end
    end

    
end











