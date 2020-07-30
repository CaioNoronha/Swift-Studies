import UIKit

/*:
 # Singleton
 Um padrão de projeto que se cria uma classe com uma única instância dentro dela, chamada de “shared”, isso mantêm um ponto global de acesso a esse objeto. Usada comumente em log de bancos ou em músicas em jogos. 
*/

class Music {
    public static var shared = Music()
    
    private init() { }
    
    public func playMusic() {
        print("Play Music")
    }
}
Music.shared.playMusic()







