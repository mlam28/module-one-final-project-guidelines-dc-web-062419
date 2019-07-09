level_1 = Skill.create(skill: "sit")
level_2 = Skill.create(skill: "shake")
level_3 = Skill.create(skill: "fetch")
level_4 = Skill.create(skill: "cook")
level_5 = Skill.create(skill: "talk")

lisa = User.create(name: "Lisa")
michelle = User.create(name:"Michelle")

daisy = Pet.create(name: "Daisy", hunger:25, happiness: 25, user_id: michelle.id)
buddy = Pet.create(name: "Buddy", hunger:25, happiness: 25, user_id: lisa.id)

Pet_Skill.create(skill_id: level_1.id, pet_id: buddy.id)
Pet_Skill.create(skill_id: level_1.id, pet_id: daisy.id)
Pet_Skill.create(skill_id: level_2.id, pet_id: daisy.id)
# binding.pry