require './parking_lot'

describe ParkingLot do
  it 'Create Parking Lot With Capacity 12' do
    subject.stub(:gets) { '12' }
    subject.create_parking_lot
    expect(subject.parking_lot_capacity).to eq(12)
  end

  it 'Already Created Parking Lot' do
    subject.stub(:gets) { '12' }
    subject.create_parking_lot
    subject.create_parking_lot
    expect do
      subject.create_parking_lot
    end.to output("Parking Lot is already created with capacity 12 and avaliable capacity is 12\n").to_stdout
  end

  it 'Check For Parking Lot Is Full' do
    subject.stub(:gets) { '1' }
    subject.create_parking_lot

    subject.stub(:gets) { 'MH-09-CY-9999' }
    subject.stub(:gets) { 'Red' }
    subject.park_a_car
    expect do
      subject.park_a_car
    end.to output("Parking Lot is House Full\n").to_stdout
  end

  it 'Check For Parking Lot Is Created Before Adding Car' do
    subject.stub(:gets) { 'MH-09-CY-9999' }
    subject.stub(:gets) { 'Red' }
    expect do
      subject.park_a_car
    end.to output("Parking Lot is not created. Please create a Parking Lot\n").to_stdout
  end
end
