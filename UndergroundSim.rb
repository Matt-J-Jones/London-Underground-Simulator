require 'csv'
@stations = []

def load_stations(line)
  temp = []
  CSV.foreach(line) { |name| @stations << name }
  return temp
end

def draw_train
  train = <<-'EXPECTED'
    ___________   _______________________________________^__
   ___   ___ |||  ___   ___   ___    ___ ___  |   __  ,----\
  |   | |   |||| |   | |   | |   |  |   |   | |  |  | |_____\
  |___| |___|||| |___| |___| |___|  | O | O | |  |  |        \
             |||                    |___|___| |  |__|         )
  ___________|||______________________________|______________/
             |||                                        /--------
  -----------'''---------------------------------------'
  EXPECTED
  puts train
end

def choose_line
  while true
    print "Enter the line you wish to travel:"
    selection = gets.chomp.downcase
  
    if selection == "high barnet"
      load_stations("stations_hb.csv")
      return
    elsif selection == "edgeware"
      load_stations("stations_e.csv")
      return
    end
  end
end

choose_line

@stations.each { |station| 
  system("clear") || system("cls")
  draw_train
  print "                              Welcome to "
  print station[0]
  sleep 1
  puts " "
}