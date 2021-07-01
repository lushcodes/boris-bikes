require_relative 'bike'

class DockingStation

    attr_reader :bike

    def release_bike
     @bike ? (@bike) : (raise "No Bikes")
         
    end

    def dock(bike)
        @bike = bike
    end

end

