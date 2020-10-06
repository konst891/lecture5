import UIKit

enum WindowState {
    case open, closed
}

enum EngineState {
    case launched, stopped
}

protocol CarProtocol {
    
    var brand: String { get set }
    var fuelTank: Int { get set }
    
    func engine(action: EngineState)
    func window(action: WindowState)
    
}

extension CarProtocol {
    
    func engine(action: EngineState) {
        switch action {
        case .launched:
            print("Engine is launched")
        case .stopped:
            print("Engine is stopped")
        }
    }
    
    func window(action: WindowState) {
        switch action {
        case .open:
            print("Window is opened")
        case .closed:
            print("Window is closed")
        }
    }
}

class Truck: CarProtocol {
    
    enum TrailerState: String {
        case attached = "Attached",
             detached = "Detached"
    }
    
    var brand: String
    var fuelTank: Int
    var trailerState: TrailerState
    
    init(brand: String, fuelTank: Int, trailerState: TrailerState) {
        self.brand = brand
        self.fuelTank = fuelTank
        self.trailerState = trailerState
    }
    
    func engine(action: EngineState, kilometers: String) {
        switch action {
        case .launched:
            print("Engine is launched")
        case .stopped:
            print("Engine is stopped")
        }
        print("Car drove \(kilometers) kilometers")
    }
}

extension Truck: CustomStringConvertible {
    var description: String {
        return """
                Truck car \(brand) with
                it has \(fuelTank) litres tank
                and trailer status is \(trailerState)
                """
    }
}

class CivilCar: CarProtocol {
    enum AirConditioningSystem: String {
        case climate = "climate control",
             airConditioner = "airconditioner"
    }
    
    var brand: String
    var fuelTank: Int
    var airConditioning: AirConditioningSystem
    
    init(brand: String, fuelTank: Int, airConditioning: AirConditioningSystem) {
        self.brand = brand
        self.fuelTank = fuelTank
        self.airConditioning = airConditioning
    }
}

extension CivilCar: CustomStringConvertible {
    var description: String {
        return """
                Civil car \(brand) with
                it has \(fuelTank) litres tank
                and it has \(airConditioning)
                """
    }
}

var renaultTruck = Truck(brand: "Renault", fuelTank: 200, trailerState: .attached)
print(renaultTruck)
renaultTruck.engine(action: .launched, kilometers: "100")

var volkswagenCar = CivilCar(brand: "Volkswagen", fuelTank: 67, airConditioning: .climate)
print(volkswagenCar)
volkswagenCar.window(action: .closed)
