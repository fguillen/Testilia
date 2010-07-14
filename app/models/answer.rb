class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  belongs_to :test_session
  
  before_validation :update_status
  named_scope :status, lambda { |status| { :conditions => { :status => status } } }
    
  private
    def update_status
      self.status = 'empty' and return   if self.selected.nil?
      self.status = 'ok' and return      if self.selected == self.question.answer_correct
      self.status = 'error' and return   if self.selected != self.question.answer_correct
    end
end
