# Кастинг
class Casting
  attr_accessor :roles, :challengers, :juries

  MAX_POINT = 10
  RESULT = {}

  def initialize(roles, challengers, juries)
    @roles = roles
    @challengers = challengers
    @juries = juries
  end

  # Возвращает результаты кастинга в виде хеша
  def casing_result
    return RESULT unless RESULT.empty?

    # пробегаем по всем ролям
    self.roles.each do |r|
      box = []
      # пробегаем по всем претендентам
      self.challengers.each do |c|
        # если претендент подходит
        if self.suit?(c, r)
          # делаем выступление
          c.act = Act.new(
              'Какая-то тема №' + Random.new.rand(1000).to_s,
              Random.new.rand(1..100),
              IO.read('text.txt').split.shuffle![0..Random.new.rand(1..100)].join(' ')
          )
          # получаем оценку судей
          box << { c.name => self.jury_evaluation(c, r) }
        #else
        #  box << { c.name => nil }
        end
      end
      RESULT[r.title] = box
    end

    RESULT

  end

  # Претендент подходит на роль?
  def suit?(challenger, role)
    role.gender == challenger.gender && challenger.age.between?(role.min_age, role.max_age)
  end

  # Судейская оценка
  def jury_evaluation(challenger, role)
    sum_point = 0

    # пробегаем по всем судьям и считаем оценки
    self.juries.each do |j|
      if j.gender == :woman && challenger.act.text.split.size < 30
        sum_point += Random.new.rand(1..7)
      elsif j.gender == :man && challenger.age.between?(18, 25)
        sum_point += Random.new.rand(7..10)
      else
        sum_point += Random.new.rand(1..10)
      end
    end
    # возвращаем среднюю оценку
    (sum_point / self.juries.count).round
  end

  # Получить наиболее подходящую роль по имени претендента
  def suitable_role(name)
    #TODO проверка

  end

end