# Точка входа в приложение

# Импортируем связаные классы
require_relative 'person'
require_relative 'jury'
require_relative 'challenger'
require_relative 'casting'
require_relative 'act'
require_relative 'role'

# Задаем роли
baba_yaga = Role.new(:woman, 50)
puts baba_yaga.inspect