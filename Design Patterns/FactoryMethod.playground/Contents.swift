//MARK:- Factory Method
class Human {
    private var name : String?
    private var age : Int?
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}

class Factory {
    public static func createHuman(name: String, age: Int) -> Human {
        return Human(name: name, age: age)
    }
}

let caio = Factory.createHuman(name: "Caio", age: 20)
