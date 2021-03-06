class Category < ActiveRecord::Base
  has_many :questions
  # May not work
  validates_associated :questions

  def count_questions
    self.questions.count
  end

  def image_name
    self.name.downcase.tr(' ', '_').concat('.jpg')
  end
end
