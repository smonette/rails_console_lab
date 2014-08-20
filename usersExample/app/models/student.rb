# class Student < ActiveRecord::Base
#   validates_length_of :first_name, minimum: 4
#   validates_length_of :last_name, minimum: 4
#   validates_uniqueness_of :last_name
#   validates_presence_of :first_name
#   validates_presence_of :last_name
# end


class Student < ActiveRecord::Base
  validates :first_name, :presence => true,
                         :length => {:minimum => 4},
                         :format => {:with => /\b[A-Z].*?\b/}

  validates :last_name, :presence => true,
                        :length => {:minimum => 4},
                        :uniqueness => true,
                        :format => {:with => /\b[A-Z].*?\b/}

  forbidden_names = []
  def not_an_instructor
    if expiration_date.present? && expiration_date < Date.today
      errors.add(:last_name, "can't be an instructor")
    end
  end

end






