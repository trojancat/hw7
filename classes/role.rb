# Роль
class Role
  attr_accessor :gender, :min_age, :max_age, :title

  def initialize(title, gender, min_age = 1, max_age = 99)
    @title = title
    @gender = gender
    @min_age = min_age
    @max_age = max_age
  end

end