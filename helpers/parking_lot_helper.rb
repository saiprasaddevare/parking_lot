require './helpers/common_helper'

# Module helper for parking_lot
module ParkingLotHelper
  QUERIES = {
    1 => 'Create Parking Lot',
    2 => 'Park Car',
    3 => 'Registration numbers of all cars of a particular Color',
    4 => 'Ticket number in which a car with a given registration number is placed',
    5 => 'Ticket numbers of all tickets where a car of a particular color is placed',
    6 => 'All Car in Parking Lot',
    7 => 'Ticket numbers with registration number'
  }.freeze

  QUERIES_METHODS = {
    'Create Parking Lot' => 'create_parking_lot',
    'Park Car' => 'park_a_car',
    'Registration numbers of all cars of a particular Color' => 'registration_number_by_color',
    'Ticket number in which a car with a given registration number is placed' => 'ticket_number_by_registration_number',
    'Ticket numbers of all tickets where a car of a particular color is placed' => 'ticket_number_by_car_color',
    'All Car in Parking Lot' => 'car_in_parking_lot',
    'Ticket numbers with registration number' => 'ticket_number_with_registration_number'
  }.freeze

  def queries_list
    puts "\n\n"
    separator_pound
    QUERIES.map do |key, queries|
      puts "\t #{key} -> #{queries}"
    end
    puts "\n Type exit or quit for closing program \n"
    puts "\n Please select number for above queries => "
    puts "\n"
  end

  def selected_queries(selected_query, parking_lot_instance)
    return puts 'Please Enter Proper Input' if QUERIES[selected_query].nil?

    separator_line
    send(QUERIES_METHODS[QUERIES[selected_query]])
    parking_lot_instance.queries_list
  end
end
