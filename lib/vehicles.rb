class Vehicle
  @@vehicles = []

  attr_accessor :make
  attr_accessor :model
  attr_accessor :year
  attr_accessor :id

  def initialize(make, model, year)
    self.make = make
    self.model = model
    self.year = year
    self.id = @@vehicles.length().+(1)
  end

    def Vehicle.all
      @@vehicles
    end

    define_method(:save) do
      @@vehicles.push(self)
    end

    def Vehicle.clear
      @@vehicles = []
    end

    define_method(:age) do
      current_year = Time.new().year()
      current_year.-(@year)
    end

    define_method(:worth_buying?) do
      american_cars = ["Chrysler", "Ford", "GM"]
      american_cars.include?(@make).&(self.age.<=(15))
    end

    def Vehicle.find(identification)
        found_vehicle = nil
        @@vehicles.each() do |vehicle|
          if vehicle.id == (identification)
            found_vehicle = vehicle
          end
        end
        found_vehicle
      end

    define_singleton_method(:find_make) do |var|
        found_vehicle = []
        @@vehicles.each do |vehicle|
          if vehicle.make.eql?(var)
            found_vehicle.push(vehicle)
          end
        end
        found_vehicle
      end

  end
