class Question
    attr_accessor :prompt, :answer
    def initialize(prompt, answer)
         @prompt = prompt
         @answer = answer
    end

    
end

$p1 = "1) What animal has the longest lifespan?\n(a) Elephant\n(b)Whale"
$p2 = "1) 2) What is the only mammal capable of true flight??\n(a) Bat\n(b)Flying Squirrel"

questions = [
    Question.new(p1, "a"),
    Question.new(p2, "b")
]

def start_quiz(questions)
    answer = ""
    score = 0
    for question in questions
         puts question.prompt
         answer = gets.chomp()
         if answer == question.answer
              score += 1
         end
    end
    puts "you got #{score} out of #{questions.length()}"
end