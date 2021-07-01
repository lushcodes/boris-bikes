require_relative 'bike'

class DockingStation
    attr_reader :bikes
    attr_accessor :capacity
    
    DEFINE_CAPACITY = 20
    def initialize(capacity = DEFINE_CAPACITY)
        @capacity = capacity
        @bikes = [] 
    end

    def release_bike
        empty? ? (raise "No bikes") : (@bikes.pop)
    end

    def dock(bike)
        full? ? (raise "Capacity full") : @bikes << bike
    end

    private

    def full?
        @bikes.length >= capacity
    end

    def empty?
        @bikes.empty? 
    end
end