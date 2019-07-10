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

lisa = User.create(name: "Lisa")
michelle = User.create(name:"Michelle")

daisy = Pet.create(name: "Daisy", hunger:25, happiness: 25, user_id: michelle.id)
buddy = Pet.create(name: "Buddy", hunger:25, happiness: 25, user_id: lisa.id)

PetSkill.create(skill_id: sit.id, skill_name: sit.name, pet_id: buddy.id)
PetSkill.create(skill_id: sit.id, skill_name: sit.name, pet_id: daisy.id)
PetSkill.create(skill_id: shake.id, skill_name: shake.name, pet_id: daisy.id)

#level 1 questions
Question.create(difficulty: 1, question: "A group of lions is known as?\n(a) a Pride\n(b)a Pack\n(c)a Group", answer: "a")
Question.create(difficulty: 1, question: "Which is the largest mammal in the world?\n(a) Bear\n(b)African Elephant\n(c) Great Whale", answer: "c")
Question.create(difficulty: 1, question: "Which is the largest living bird?\n(a) The Dalmation Pelican\n(b)The Ostrich\n(c) The Emu", answer: "b")

#level 2 questions
Question.create(difficulty: 2, question: "Murder, is the collective noun for a group of which birds?\n(a) Doves\n(b)Crows\n(c) Pigeons", answer: "b")
Question.create(difficulty: 2, question: "What color is an ocelot?\n(a) Grey and Black\n(b)Purple and Pink\n(c) Yellow and Black", answer: "c")
Question.create(difficulty: 2, question: "On a common lady bug, what color are the spots?\n(a) Grey\n(b)The Red\n(c) Black", answer: "c")

#level 3 questions

#level 4 questions

#level 5 questions

# binding.pry