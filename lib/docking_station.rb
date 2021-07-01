require_relative 'bike'

class DockingStation

    def initialize(capacity = 20)
    @bikes = []
    
    end
    attr_reader :bikes

    def release_bike
     !@bikes.empty? ? (@bikes.pop) : (raise "No Bikes")
    end

    def dock(bike)
        @bikes.length >= 20 ? (raise "Capacity full") : @bikes << bike
    end

end

