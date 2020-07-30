//MARK:- Strategy
protocol Strategy {
    func showPath() -> String
}

class BikeWay : Strategy {
    func showPath() -> String {
        return "Andando de Bike"
    }
}

class CarWay : Strategy {
    func showPath() -> String {
        return "Andando de Carro"
    }
}

class WalkWay : Strategy {
    func showPath() -> String {
        return "Andando a pé"
    }
}

class GPS {
    var strategy : Strategy
    
    init(strategy : Strategy) {
        self.strategy = strategy
    }
}

class User {
    var gps = GPS(strategy: WalkWay())

    func showStrategy() {
        gps.strategy.showPath()
    }
}
