# Персонаж. Родительский класс для претендента и члена жюри
class Person
  attr_accessor :name, :gender

  def initialize(name, gender)
    @name = name
    @gender = gender
  end

end