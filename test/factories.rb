Factory.define :user do |f|
  f.password 'wadus'
  f.password_confirmation 'wadus'
  f.sequence(:email) { |n| "email_#{n}@email.com" }
end

Factory.define :exam do |f|
  # f.sequence(:name) { |n| "Name #{n}" }
  # f.sequence(:location) { |n| "Location #{n}" }
  # f.visible true
end

Factory.define :cell do |f|
  f.association :exam
  f.association :question

end

Factory.define :question do |f|
  f.sequence(:subject) { |n| "Question Subject #{n}" }
  f.answer_a 'Answer A'
  f.answer_b 'Answer B'
  f.answer_c 'Answer C'
  f.answer_d 'Answer D'
  f.answer_correct 'a'
  f.category 'Category'
  f.level 'Level'
end

Factory.define :test_session do |f|
  f.association :exam
  f.association :user
end

Factory.define :answer do |f|
  f.association :question
  f.association :test_session
end

