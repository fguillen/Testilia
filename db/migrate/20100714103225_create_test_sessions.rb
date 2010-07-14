class CreateTestSessions < ActiveRecord::Migration
  def self.up
    create_table :test_sessions do |t|
      t.integer :exam_id
      t.integer :user_id
      t.string :status, :null => false, :default => 'no-completed'

      t.timestamps
    end
  end

  def self.down
    drop_table :test_sessions
  end
end
