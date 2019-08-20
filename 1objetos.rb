class Table
    attr_accessor :mesa, :recaudacion
    def initialize(mesa,*recaudacion)
        @mesa = mesa
        @recaudacion = recaudacion.map(&:to_i)
    end

    def promedio
        @recaudacion.sum/@recaudacion.size.to_f
    end

    def recaudacion_max
        @recaudacion.max
    end  
end

table_list = []
data = []
File.open('casino.txt', 'r') { |file| data = file.readlines}
data.each do |prod|
    ls = prod.split(', ')
    table_list << Table.new(*ls)
end

table_list.each_with_index do |table, i|
    puts "#{table.mesa} recaudado #{table.recaudacion_max} el #{i+1}"
end  

promedios = table_list.map(&:promedio)
puts "promedio total #{promedios.sum / promedios.size.to_f}"
