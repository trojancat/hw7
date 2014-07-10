class Role
  attr_accessor :gender, :min_age, :max_age, :title

  def initialize(title, gender, min_age = 1, max_age = 99)
    @title = title
    @gender = gender
    @min_age = min_age
    @max_age = max_age
  end

  # Is age correct?
  def age_correct?
    
  end

  # Is a woman role?
  def is_woman_role?
    
  end

end