require './car'
require './ticket'

describe Car do
  it 'Add Car' do
    subject.add_car('MH-09-AB-9999', 'Black')
    expect(subject.car_details.find { |car_detail| car_detail[:registration_number] == 'MH-09-AB-9999' && car_detail[:color] == 'Black' }).to_not be_nil
  end

  it 'Registration Number by color' do
    subject.add_car('MH-09-AB-9999', 'Black')
    expect do
      subject.registration_number_by_color('Black')
    end.to output("______________________________________________________________________________________________\nRegistration Number of cars with color Black\n#{subject.car_details[0][:registration_number]}\n").to_stdout
  end

  it 'No Car With Registration Number by color' do
    expect do
      subject.registration_number_by_color('Black')
    end.to output("______________________________________________________________________________________________\nNo Car With Color Black found in parking lot\n").to_stdout
  end

  it 'Ticket Number By Registration Number' do
    subject.add_car('MH-09-AB-9999', 'Black')
    expect do
      subject.ticket_number_by_registration_number('MH-09-AB-9999')
    end.to output("______________________________________________________________________________________________\nTicket Numbers of car with registration number #{subject.car_details[0][:registration_number]}\n#{Ticket.ticket_number}\n").to_stdout
  end

  it 'No Car With Ticket Number By Registration Number' do
    expect do
      subject.ticket_number_by_registration_number('MH-09-AB-9999')
    end.to output("______________________________________________________________________________________________\nNo Car With Registration Number MH-09-AB-9999 found in parking lot\n").to_stdout
  end

  it 'Ticket Number By Color' do
    subject.add_car('MH-09-AB-9999', 'Black')
    expect do
      subject.ticket_number_by_car_color('Black')
    end.to output("______________________________________________________________________________________________\nTicket Number of cars with color #{subject.car_details[0][:color]}\n#{Ticket.ticket_number}\n").to_stdout
  end

  it 'No Car With Ticket Number By Color' do
    expect do
      subject.ticket_number_by_car_color('Black')
    end.to output("______________________________________________________________________________________________\nNo Car With Color Black found in parking lot\n").to_stdout
  end
end
