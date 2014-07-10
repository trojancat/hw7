# Кастинг
class Casting
  attr_accessor :roles, :challengers, :juries

  MAX_POINT = 10

  def initialize(roles, challengers, juries)
    @roles = roles
    @challengers = challengers
    @juries = juries
  end

  # Возвращает результаты кастинга в виде хеша
  def casing_result
    # пробегаем по всем претендентам
    self.challengers.each do |chal|
      puts chal.name
    end

  end

  # Получить наиболее подходящую роль по имени претендента
  def suitable_role(name)
    #TODO проверка

  end

end