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


    # пробегаем по всем претендентам
    self.challengers.each do |c|
      box = []
      sum_act_duration = 0;
      # пробегаем по всем ролям
      self.roles.each do |r|
        # если претендент подходит
        if self.suit?(c, r)
          # делаем выступление
          c.act = Act.new(
              'Какая-то тема №' + Random.new.rand(1000).to_s,
              Random.new.rand(1..100),
              IO.read('text.txt').split.shuffle![0..Random.new.rand(1..100)].join(' ')
          )
          sum_act_duration += c.act.duration
          # получаем оценку судей
          box << { r.title => self.jury_evaluation(c, r) }
        #else
        #  box << { c.name => nil }
        end
      end
      RESULT[c.name] = { roles: box, sum_act_duration: sum_act_duration}
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

  # Получить наиболее подходящую роль для претендента
  def suitable_role(name)

    return 'Не подходит ни одна роль.' if self.casing_result[name][:roles].empty?

    max = {'none' => 0}
    self.casing_result[name][:roles].each do |r|
      puts r.inspect
      max = r if r.values.first > max.values.first
    end

    return 'Наиболее подходящая роль: ' + max.keys.first.to_s + '.'

  end

  # Общая продолжительность выступлений у претендента
  def sum_act_duration(name)
    self.casing_result[name][:sum_act_duration]
  end


end