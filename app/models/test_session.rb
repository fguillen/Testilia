class TestSession < ActiveRecord::Base
  belongs_to :exam
  has_many :answers, :dependent => :destroy
  belongs_to :user
  
  accepts_nested_attributes_for :answers
  
  before_validation :update_status
    
  private
    def update_status
      self.status = self.answers.status('empty').count == 0 ? 'completed' : 'no-completed'
    end  
end
