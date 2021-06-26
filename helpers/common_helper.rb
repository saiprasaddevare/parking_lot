# Common helper module
module CommonHelper

  def separator_line
    puts '#####################################################################################################'
  end
  def display_action_details(detail)
    puts '#####################################################################################################'
    puts detail
    puts "#####################################################################################################\n\n"
  end

  def get_user_input(message)
    puts message
    gets.chomp
  end
end
