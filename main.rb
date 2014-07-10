# Точка входа в приложение

# Импортируем связаные классы
require_relative 'classes/person'
require_relative 'classes/jury'
require_relative 'classes/challenger'
require_relative 'classes/casting'
require_relative 'classes/act'
require_relative 'classes/role'

# Роли
roles = [
  # мужские
  Role.new('Кощей', :man, 40),
#=begin
  Role.new('Питер Пен', :man, 10, 16),
  Role.new('Безумный шляпник', :man, 16, 25),
  Role.new('Джек Воробей', :man, 25, 40),
  Role.new('Бетман', :man, 30, 45),
  # женские
  Role.new('Принцесса', :woman, 16, 25),
  Role.new('Баба Яга', :woman, 50),
  Role.new('Золушка', :woman, 16, 22),
  Role.new('Дюймовочка', :woman, 8, 12),
  Role.new('Лара Крофт', :woman, 25, 35),
#=end
]

# Претенденты
challengers = [
    Challenger.new('Вася', :man, 20),
#=begin
    Challenger.new('Петя', :man, 10),
    Challenger.new('Марат', :man, 16),
    Challenger.new('Кирилл', :man, 32),
    Challenger.new('Марсель', :man, 18),
    Challenger.new('Камиль', :man, 28),
    Challenger.new('Алексей', :man, 55),
    Challenger.new('Сергей', :man, 38),
    Challenger.new('Янек', :man, 17),
    Challenger.new('Аарон', :man, 48),
    Challenger.new('Лиза', :woman, 20),
    Challenger.new('Гузель', :woman, 10),
    Challenger.new('Адель', :woman, 16),
    Challenger.new('Ванесса', :woman, 32),
    Challenger.new('Сара', :woman, 18),
    Challenger.new('Катя', :woman, 28),
    Challenger.new('Настя', :woman, 55),
    Challenger.new('Яна', :woman, 38),
    Challenger.new('Олеся', :woman, 17),
    Challenger.new('Венера', :woman, 48),
#=end
]

# Судейская комиссия
juries = [
  Jury.new('Филипп Киркоров', :man),
  Jury.new('Арнольд Шварценейгер', :man),
  Jury.new('Джордж Клуни', :man),
  Jury.new('Бен Афлик', :man),
  Jury.new('Марат Башаров', :man),
  Jury.new('Анастасия Стоцкая', :woman),
  Jury.new('Мария Шарапова', :woman),
  Jury.new('Кира Найтли', :woman),
  Jury.new('Бритни Спирс', :woman),
  Jury.new('Мила Йовович', :woman),
]

# Начинаем кастинг
casting = Casting.new(roles, challengers, juries)

# Результаты кастинга
casting.casing_result.inspect
puts casting.casing_result.inspect

# Наиболее подходящая роль для выступающего
puts casting.suitable_role('Лиза')
