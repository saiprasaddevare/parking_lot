# Ticket Class for holding Ticket details
class Ticket
  @@ticket_number = 0

  def initialize
    @ticket_number = generate_ticket_number
  end

  def generate_ticket_number
    @@ticket_number += 1
  end

  def ticket_number
    @ticket_number
  end
end
