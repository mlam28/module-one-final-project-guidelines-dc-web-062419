User.delete_all
Skill.delete_all
Pet.delete_all
PetSkill.delete_all

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
# binding.pry