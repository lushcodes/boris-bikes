require 'vans'
require 'docking_station'

describe Vans do

    it 'responds to take_broken_bike method' do
    expect(subject).to respond_to(:take_broken_bike)
    end
        describe '#take_broken_bike' do
       it 'accesses the bikes array in DockingStation class'
       bike_array = DockingStation.new(@bikes)
       expect(subject).to respond_to(bike_array)
end
end

