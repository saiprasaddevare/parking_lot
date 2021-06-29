require_relative '../parking_lot'

parking_lot_instance = ParkingLot.new
parking_lot_instance.queries_list

until (selected_query = gets.chomp) =~ /(?:ex|qu)it/i
  parking_lot_instance.selected_queries(selected_query.to_i, parking_lot_instance)
end
