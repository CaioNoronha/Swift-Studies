//MARK:- Observer
protocol House {
    var cameras : [Camera] { get set }

    func addCameras(camera: Camera)
    func removeCamera(camera: Camera)
    func notifyCamera(cameras: [Camera])
}

protocol Camera {
    var id: Int { get set }

    func aZombieAppear(_ value: Any?)
}

class WhiteHouse: House {

    var zombie: String {
        didSet {
            self.notifyCamera(cameras: self.cameras)
        }
    }


    internal var cameras: [Camera] = []

    init(zombie: String) {
        self.zombie = zombie
    }

    func addCameras(camera: Camera) {
        for i in cameras {
            if i.id == camera.id {
                return
            }
        }
        self.cameras.append(camera)

    }

    func removeCamera(camera: Camera) {
        
        for (i, j) in cameras.enumerated() {
            if j.id == camera.id {
                self.cameras.remove(at: i)
            }
        }
        return
    }

    func notifyCamera(cameras: [Camera]) {
        for i in cameras {
            i.aZombieAppear(zombie)
        }
    }

    deinit {
        cameras.removeAll()
    }
}

struct BlackCamera : Camera {
    
    var id: Int
    
    func aZombieAppear(_ value: Any?) {
        print("\(String(describing: value)) appear")
    }
    
    
}

let house = WhiteHouse(zombie: "Zombie")

let camera = BlackCamera(id: 1)
house.addCameras(camera: camera)

let camera2 = BlackCamera(id: 2)
house.addCameras(camera: camera2)

house.zombie = "Zombie 2"

