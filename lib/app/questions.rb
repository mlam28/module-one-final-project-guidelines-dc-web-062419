class Question1
    @@all =[]
    attr_accessor :prompt, :answer
    def initialize(prompt, answer)
         @prompt = prompt
         @answer = answer
         self.class.all << self
    end

    def self.all
    @@all
    end

#binding.pry
    def self.start_quiz1
        answer = ""
        score = 0
        for question in @@all
            puts question.prompt
            loop do
              answer = gets.chomp
              break if answer == "a" || answer == "b" || answer == "c"
              puts "Enter a valid input"
            end
             if answer == question.answer
                  score += 1
              end
        end
        if score == @@all.length 
          puts "You got #{score} out of #{@@all.length} right! Your pet has leveled up!"
        else
          puts "You scored #{score} out of #{@@all.length} questions right. Unfortunately, you did not reach the next level. Would you like to try again?"
          puts "Enter yes if you would like to play again, else you will be returned to the main menu"
          input=gets.chomp
          if input == "yes"
           self.start_quiz1
          else 
            puts "returning to main menu"
          end
        end
    end

    
end

p1 = "1) What animal has the longest lifespan?\n(a) Elephant\n(b)Whale\n(c)Giant Tortoise"
p2 = "2) What is the only mammal capable of true flight??\n(a) Bat\n(b)Flying Squirrel\n(c)Hummingbird"

questions = [
    Question1.new(p1, "c"),
    Question1.new(p2, "b")
]
#binding.pry









