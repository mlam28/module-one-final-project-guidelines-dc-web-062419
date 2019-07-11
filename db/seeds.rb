User.delete_all
Skill.delete_all
Pet.delete_all
PetSkill.delete_all
Question.delete_all

sit = Skill.create(name: "sit")
shake = Skill.create(name: "shake")
fetch= Skill.create(name: "fetch")
cook = Skill.create(name: "cook")
talk = Skill.create(name: "talk")

# lisa = User.create(name: "Lisa")
# michelle = User.create(name:"Michelle")

# daisy = Pet.create(name: "Daisy", hunger:25, happiness: 25, user_id: michelle.id)
# buddy = Pet.create(name: "Buddy", hunger:25, happiness: 25, user_id: lisa.id)

# PetSkill.create(skill_id: sit.id, skill_name: sit.name, pet_id: buddy.id)
# PetSkill.create(skill_id: sit.id, skill_name: sit.name, pet_id: daisy.id)
# PetSkill.create(skill_id: shake.id, skill_name: shake.name, pet_id: daisy.id)

#level 1 questions
Question.create(difficulty: 1, question: "A group of lions is known as?\n(a) A Pride\n(b) A Pack\n(c) A Group", answer: "a")
Question.create(difficulty: 1, question: "Which is the largest mammal in the world?\n(a) Bear\n(b) African Elephant\n(c) Great Whale", answer: "c")
Question.create(difficulty: 1, question: "Which is the largest living bird?\n(a) The Dalmation Pelican\n(b) The Ostrich\n(c) The Emu", answer: "b")

#level 2 questions
Question.create(difficulty: 2, question: "Murder, is the collective noun for a group of which birds?\n(a) Doves\n(b) Crows\n(c) Pigeons", answer: "b")
Question.create(difficulty: 2, question: "What color is an ocelot?\n(a) Grey and Black\n(b) Purple and Pink\n(c) Yellow and Black", answer: "c")
Question.create(difficulty: 2, question: "On a common lady bug, what color are the spots?\n(a) Grey\n(b) Red\n(c) Black", answer: "c")

#level 3 questions
Question.create(difficulty: 3, question: "What is a baby whale called?\n(a) A Chick\n(b)A Calf\n(c) A Lamb", answer: "b")
Question.create(difficulty: 3, question: "From which country does the Dalmatian dog breed come from?\n(a) Yugoslavia\n(b) The Czech Republic\n(c) Spain", answer: "a")
Question.create(difficulty: 3, question: "Which of these dinosaurs lived during the Jurassic Period?\n(a) Triceratops\n(b) Stegosaurus\n(c) Eoraptor", answer: "b")

#level 4 questions
Question.create(difficulty: 4, question: "What is the term for a young horse?\n(a) A Cub\n(b)A A Cygnet\n(c) A Foal", answer: "c")
Question.create(difficulty: 4, question: "Which of the following is NOT a characteristic of reptiles?\n(a)Most lay eggs\n(b)They are warmblooded\n(c) They breathe with lungs", answer: "b")
Question.create(difficulty: 4, question: "Which of these animals is NOT endangered?\n(a)A Capybara\n(b)A Jaguar\n(c)A Red Wolf", answer: "a")

#level 5 questions
Question.create(difficulty: 5, question: " Which animal could not survive in Africa?\n(a) A Tsetse fly\n(b)A Wildcat\n(c) A Hippopotamus", answer: "b")
Question.create(difficulty: 5, question: "What is the most poisonous snake on the planet?\n(a)An Inland Taipan\n(b)A Cobra\n(c) A Black mamba", answer: "b")
Question.create(difficulty: 5, question: "What is a distinguishing feature of a marsupial?\n(a)They have very long necks\n(b)They carry their young in an external pouch\n(c)A They live most of their lives in trees", answer: "a")
# binding.pry