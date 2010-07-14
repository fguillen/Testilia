class CreateAnswers < ActiveRecord::Migration
  def self.up
    create_table :answers do |t|
      t.integer :user_id
      t.integer :test_session_id
      t.integer :question_id
      t.string :selected
      t.string :status, :null => false, :default => 'empty'

      t.timestamps
    end
  end

  def self.down
    drop_table :answers
  end
end
