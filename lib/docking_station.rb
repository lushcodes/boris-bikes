require_relative 'bike'
require_relative 'vans'

class DockingStation
    attr_reader :bikes
    attr_accessor :capacity
    
    DEFINE_CAPACITY = 20
    def initialize(capacity = DEFINE_CAPACITY)
        @capacity = capacity
        @bikes = [] 
    end

    def release_bike(bike = [])
        (raise "No bikes") if empty?
        (raise "Broken Bike" if bike.broken)
        (@bikes.delete(bike))
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