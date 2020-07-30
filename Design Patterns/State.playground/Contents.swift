import UIKit

class Player {
    private var state: State
    
    init(state: State) {
        self.state = state
    }
    
    func changeState(state: State) {
        self.state = state
        self.state.update(player: self)
    }
}

protocol State: class {
    
    func update(player: Player)

}

class BaseState: State {

    private(set) weak var player: Player?

    func update(player: Player) {
        self.player = player
    }
}

/// Concrete States implement various behaviors, associated with a state of the
/// Context.
class RestartState: BaseState {
    
    override init() {
        super.init()
        self.restart()
    }

    func restart() {
        print("Restart")
    }
}

class GameOverState: BaseState {
    
    override init() {
        super.init()
        self.gameOver()
    }

    func gameOver() {
        print("Game Over")
    }
}

class ExitState: BaseState {
    override init() {
        super.init()
        self.exit()
    }
    
    func exit() {
        print("Exit Game")
    }
}

let player = Player(state: GameOverState())
player.changeState(state: RestartState())
player.changeState(state: ExitState())


