class Tortas
  attr_accessor :name, :time
  def initialize(name,time)
    @name = name
    @time = time
  end
end


class Horno 
  attr_accessor :oven_time
  
  def initialize(charola, oven_time)
    @oven_time = oven_time
    @charola = charola
    @results = []
    @report = []
    # salchicha = Tortas.new("salchicha", 20)
    # p salchicha.time
  end 

  def oven_time
    time = 0
    @charola.shuffle.each do |torta|
      for time in 0..@oven_time
        baking_time(time, torta)
      end
      @report << [torta.name, @results[-1]]
    end
    p @report
  end

  def baking_time(counting_time, torta)
    status = counting_time.to_f / torta.time
    case 
    when status < 0.5
      @results << "crudo"
    when status < 0.7
       @results << "casi listo"
    when status <= 1
       @results << "listo"
    when status > 1
       @results <<"Quemado"
    end   
  end   
end


torta1= Tortas.new("cubana", 20)
torta2 = Tortas.new("jamon", 7)
torta3= Tortas.new("4quesos", 21)
torta4 = Tortas.new("res", 10)
torta5= Tortas.new("milanesa", 10)

charola = [torta1, torta2, torta3, torta4, torta5]
# horno = Horno.new
baking_time = Horno.new(charola,20)
baking_time.oven_time

#reporte