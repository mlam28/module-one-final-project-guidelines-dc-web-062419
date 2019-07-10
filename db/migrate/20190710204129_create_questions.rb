class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.integer :difficulty
      t.string :question
      t.string :answer
    end
  end
end
