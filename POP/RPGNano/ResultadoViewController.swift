//
//  ResultadoViewController.swift
//  RPGNano
//
//  Created by Caio Carvalho de Noronha on 02/10/19.
//  Copyright © 2019 caivis. All rights reserved.
//

import UIKit

enum Monsters : String {
    case NinjaVerde = "Ninja Verde"
    case Bebe = "Bebe"
    case NinjaCinza = "Ninja Cinza"
    case Vovo = "Vovo"
    case Cao = "Cao"
    case Monge = "Monge"
    case Caveira = "Caveira"
    case NinjaVermelho = "Ninja Vermelho"
    case Dandara =  "Dandara"
    case CaoMal = "Cao Mal"
}

class ResultadoViewController: UIViewController {
    
    @IBOutlet weak var weaponImage: UIImageView!
    @IBOutlet weak var weaponLabel: UILabel!
    @IBOutlet weak var imageMonster: UIImageView!
    @IBOutlet weak var labelMonster: UILabel!
    
    var weaponName = String()
    var imageWeapon = UIImage()
    var damage = Int()
    let monster = Monster()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        weaponLabel.text = weaponName
        weaponImage.image = imageWeapon
        randomMonster()
    }
    
    func randomMonster() {
        
        let r = Int.random(in: 1...10)
        
        imageMonster.image = UIImage(named: "m\(r)")
        
        switch r {
        case 1:
            labelMonster.text = Monsters.NinjaVerde.rawValue
            
        case 2:
            labelMonster.text = Monsters.Bebe.rawValue
            
        case 3:
            labelMonster.text = Monsters.NinjaCinza.rawValue

        case 4:
            labelMonster.text = Monsters.Vovo.rawValue

        case 5:
            labelMonster.text = Monsters.Cao.rawValue

        case 6:
            labelMonster.text = Monsters.Monge.rawValue

        case 7:
            labelMonster.text = Monsters.Caveira.rawValue

        case 8:
            labelMonster.text = Monsters.NinjaVermelho.rawValue
            
        case 9:
            labelMonster.text = Monsters.Dandara.rawValue

        case 10:
            labelMonster.text = Monsters.CaoMal.rawValue
            
        default:
            labelMonster.text = "Deu ruim"
        }
    }
    
    @IBAction func attackMonster(_ sender: Any) {
        if monster.hitChance(damage: damage) {
            labelMonster.text  = "Morreu"
        } else {
            labelMonster.text! += " nao morreu"
        }
    }
}
