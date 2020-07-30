
//MARK:- Builder
protocol Builder {
    
    func producePartA()
    func producePartB()
    func producePartC()
}

class Product1 {
    private var parts = [String]()

    func add(part: String) {
        self.parts.append(part)
    }

    func listParts() -> String {
        return "Product parts: " + parts.joined(separator: ", ") + "\n"
    }
}

class ConcreteBuilder1: Builder {
    
    private var product = Product1()
    
    func reset() {
        product = Product1()
    }
    
    func producePartA() {
        product.add(part: "PartA1")
    }
    
    func producePartB() {
        product.add(part: "PartB1")
    }
    
    func producePartC() {
        product.add(part: "PartC1")
    }
    
    func retrieveProduct() -> Product1 {
        let result = self.product
        result
        return result
    }
}

class Director {
    private var builder: Builder?
    
    func update(builder: Builder) {
        self.builder = builder
    }
    
    func buildMinimalViableProduct() {
        builder?.producePartA()
    }
    
    func buildFullFeaturedProduct() {
        builder?.producePartA()
        builder?.producePartB()
        builder?.producePartC()
    }
}

class Client {
    
    static func someClientCode(director: Director) {
        let builder = ConcreteBuilder1()
        director.update(builder: builder)
        
        print("Standard basic product:")
        director.buildMinimalViableProduct()
        print(builder.retrieveProduct().listParts())
        
        print("Standard full featured product:")
        director.buildFullFeaturedProduct()
        print(builder.retrieveProduct().listParts())
    }
}

class BuilderConceptual {
    func testBuilderConceptual() {
        let director = Director()
        Client.someClientCode(director: director)
    }
}

let build = BuilderConceptual()
build.testBuilderConceptual()
