# Parking Lot class
class ParkingLot
  QUERIES = {
    1 => 'Create Parking Lot',
    2 => 'Park Car',
    3 => 'Registration numbers of all cars of a particular Color',
    4 => 'Ticket number in which a car with a given registration number is placed',
    5 => 'Ticket numbers of all tickets where a car of a particular color is placed'
  }.freeze

  QUERIES_METHODS = {
    'Create Parking Lot' => 'create_parking_lot',
    'Park Car' => 'park_a_car'
  }.freeze

  attr_accessor :parking_lot_capacity

  def queries_list
    puts '##########################################################################################'
    QUERIES.map do |key, queries|
      puts "\t #{key} -> #{queries}"
    end
    puts "\nType exit or quit for closing program \n"
    puts "########################################################################################## \n\n"
  end

  def selected_queries(selected_query)
    return puts 'Please Enter Proper Input' if QUERIES[selected_query].nil?

    send(QUERIES_METHODS[QUERIES[selected_query]])
  end

  def create_parking_lot
    puts 'Enter Parking Lot Capacity'
    @parking_lot_capacity = gets.chomp
    puts '############################################################################'
    puts "\n Created Parking Lot with #{@parking_lot_capacity} capacity \n\n"
    puts "############################################################################ \n\n"
  end

  def park_a_car
    puts 'Enter Car Registration Number'
  end
end

parking_lot_instance = ParkingLot.new
parking_lot_instance.queries_list
puts "\nPlease Select number for above queries"

until (selected_query = gets.chomp) =~ /(?:ex|qu)it/i
  parking_lot_instance.selected_queries(selected_query.to_i)
end
