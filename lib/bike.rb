class Bike

    attr_reader :broken

    def working?
        true
    end

    def report
        @broken = true
    end
end

