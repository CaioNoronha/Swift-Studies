import UIKit

protocol Command {
    
    func execute()
}

class EnterCommand : Command {
    
    func execute() {
        print("Entrou no App")
    }
    
    
}

class SendMessageCommand : Command {
    
    var chat: Chat
    var message: String
    
    init(chat: Chat, message: String) {
        self.chat = chat
        self.message = message
    }
    
    func execute() {
        chat.sendMessage(message: message)
        chat.receivedMessage(message: message)
    }
}

class Chat {
    func sendMessage(message: String) {
        print("\(message) √")
    }
    
    func receivedMessage(message: String) {
        print("\(message) √√")
    }
}

class Person {
    
    private var enter: Command?
    
    private var send: Command?
    
    func setEnter(_ command: Command) {
        enter = command
    }
    
    func setSend(_ command: Command) {
        send = command
    }
    func sendMessage() {
        enter?.execute()
        send?.execute()
    }
}

let caio = Person()
caio.setEnter(EnterCommand())

let chat = Chat()
caio.setSend(SendMessageCommand(chat: chat, message: "Eae gente"))
caio.sendMessage()
