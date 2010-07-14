class TestSession < ActiveRecord::Base
  belongs_to :exam
  has_many :answers, :dependent => :destroy
  belongs_to :user
  
  accepts_nested_attributes_for :answers
  
  before_validation :update_status
    
  private
    def update_status
      puts "updating status"
      puts "self.answers.status('empty').count: #{self.answers.status('empty').count}"
      self.status = self.answers.status('empty').count == 0 ? 'completed' : 'no-completed'
    end  
end
