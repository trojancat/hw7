# Претендент на роль
class Challenger < Person
  attr_accessor :age, :act

  def initialize(name, gender, age)
    super(name, gender)
    @age = age
  end

end