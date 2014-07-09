# Точка входа в приложение

# Импортируем связаные классы
require_relative 'classes/person'
require_relative 'classes/jury'
require_relative 'classes/challenger'
require_relative 'classes/casting'
require_relative 'classes/act'
require_relative 'classes/role'

# Задаем роли
baba_yaga = Role.new(:woman, 50)
puts baba_yaga.inspect