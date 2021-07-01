
require 'docking_station'

describe DockingStation do

    it { is_expected.to respond_to :release_bike }
  
    it 'releases working bikes' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject).to respond_to(:release_bike)
    end

    it { is_expected.to respond_to(:dock).with(1).argument }

    it { is_expected.to respond_to(:bike) }

    it 'returns docked bikes' do
        bike = Bike.new
        subject.dock(bike)
        expect(subject.bike).to eq bike
    end

    describe "#release_bike" do 
        it 'should not release bikes if there are none' do
            expect {subject.release_bike}.to raise_error("No Bikes")
        end
    end

    describe '#dock' do
        it 'Should not let us dock bike when one is docked' do
            bike1, bike2 = Bike.new
            subject.dock(bike1)
            expect {subject.dock(bike2)}.to raise_error("Capacity full")
        end
    end
end