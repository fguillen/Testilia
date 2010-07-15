class CreateExams < ActiveRecord::Migration
  def self.up
    create_table :exams do |t|
      t.string :kind
      t.string :name
      t.integer :position, :null => false, :default => 0
      t.timestamps
    end
  end
  
  def self.down
    drop_table :exams
  end
end
