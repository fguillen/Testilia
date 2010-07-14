class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.string :subject
      t.string :answer_a
      t.string :answer_b
      t.string :answer_c
      t.string :answer_d
      t.string :answer_correct
      t.string :category
      t.string :level
      t.timestamps
    end
  end
  
  def self.down
    drop_table :questions
  end
end
