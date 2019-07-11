class Question < ActiveRecord::Base
  

#binding.pry
    def self.start_quiz(user)
      level = user.find_highest_skill + 1
      # binding.pry
        answer = ""
        score = 0
        count = 0
          self.all.each do |question|
            if question.difficulty == level 
              puts question.question 
              loop do
                answer = gets.chomp
                count += 1
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
        else
          puts "You scored #{score} out of #{count} questions right. Unfortunately, you did not reach the next level. Would you like to try again?"
          puts "Enter yes if you would like to play again, else you will be returned to the main menu"
          input=gets.chomp
          if input == "yes"
           self.start_quiz(user)
          else 
            puts "returning to main menu"
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









