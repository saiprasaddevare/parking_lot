require './helpers/common_helper'

# Module helper for parking_lot
module ParkingLotHelper
  QUERIES = {
    1 => 'Create Parking Lot',
    2 => 'Park Car',
    3 => 'Registration numbers of all cars of a particular Color',
    4 => 'Ticket number in which a car with a given registration number is placed',
    5 => 'Ticket numbers of all tickets where a car of a particular color is placed'
  }.freeze

  QUERIES_METHODS = {
    'Create Parking Lot' => 'create_parking_lot',
    'Park Car' => 'park_a_car',
    'Registration numbers of all cars of a particular Color' => 'registration_number_by_color'
  }.freeze

  def queries_list
    separator_line
    QUERIES.map do |key, queries|
      puts "\t #{key} -> #{queries}"
    end
    puts "\nType exit or quit for closing program \n"
    separator_line
    puts "\n\n"
  end

  def selected_queries(selected_query, parking_lot_instance)
    return puts 'Please Enter Proper Input' if QUERIES[selected_query].nil?

    send(QUERIES_METHODS[QUERIES[selected_query]])
    parking_lot_instance.queries_list
  end
end
