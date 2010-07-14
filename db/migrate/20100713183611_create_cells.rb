class CreateCells < ActiveRecord::Migration
  def self.up
    create_table :cells do |t|
      t.integer :exam_id
      t.integer :question_id
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :cells
  end
end
