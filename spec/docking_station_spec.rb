require "docking_station"
require "bike"

describe DockingStation do
    let(:bike) { double(:bike) }

    it 'releases working bikes' do
        subject.dock(bike)
        expect(subject).to respond_to(:release_bike)
    end
    
    it { is_expected.to respond_to(:dock).with(1).argument }

    it 'returns docked bikes' do
        subject.dock(bike)
        expect(subject.bikes).to eq [bike]
    end

    it 'doesnt release a broken bike' do
        allow(bike).to receive(:report).and_return(true)
        allow(bike).to receive(:broken).and_return(true)
        bike.report
        subject.dock(bike)
        expect{ subject.release_bike(bike) }.to raise_exception("Broken Bike")
    end
    
    it 'raises error when empty' do
        expect { subject.release_bike }.to raise_exception("No bikes")
    end

    it 'defaults to constant capacity' do
        expect(subject.capacity).to eq(DockingStation::DEFINE_CAPACITY)
    end

    describe '#dock' do
        it 'Should not let us dock bike when one is docked' do
            DockingStation::DEFINE_CAPACITY.times { b = bike; subject.dock(b)}
            expect {subject.dock(bike)}.to raise_error("Capacity full")
        end
    end
end

