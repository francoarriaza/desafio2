require 'date'
class Course
    def initialize(nombre,f_ini,fecha_fin)
        @nombre = nombre
        @f_ini = Date.parse(f_ini)
        @fecha_fin = Date.parse(fecha_fin)
    end

    def cursos_previos(fecha)
        puts "El curso #{@nombre} inicia el #{@f_ini}" if @f_ini <fecha
    end

    def cursos_despues(fecha)
        puts "El curso #{@nombre} finaliza el #{@fecha_fin}" if @fecha_fin >fecha
    end
end

courses = []
data = []
File.open('cursos.txt', 'r') { |file| data = file.readlines}
data.each do |lines|
    nombre,f_ini,fecha_fin = lines.split(', ')
    courses << Course.new(nombre,f_ini,fecha_fin)
end

courses.each do |curso|
    curso.cursos_previos(Date.today)
    curso.cursos_despues(Date.today)
end

