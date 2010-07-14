class Exam < ActiveRecord::Base
  has_many :cells, :dependent => :destroy
  has_many :questions, :through => :cells
  has_many :test_sessions, :dependent => :destroy
end
