# Common helper module
module CommonHelper
  def separator_line
    puts '______________________________________________________________________________________________'
  end

  def separator_pound
    puts '##############################################################################################'
  end

  def display_action_details(detail)
    puts '_________________________________________________________________________________________'
    puts detail
    puts "_________________________________________________________________________________________\n\n"
  end

  def get_user_input(message)
    puts message
    gets.chomp
  end
end
