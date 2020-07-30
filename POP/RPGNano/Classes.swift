//
//  Weapon.swift
//  RPGNano
//
//  Created by Caio Carvalho de Noronha on 30/09/19.
//  Copyright © 2019 caivis. All rights reserved.
//

import UIKit

//MARK: Weapon
protocol WeaponProtocol {
    var damage : Int { get set }
    
    init ()
    
    func attack() -> Bool
}

struct ArcoEFlecha : WeaponProtocol {
    
    var damage: Int = Int.random(in: 30...50)
    
    init() {
    }
    
    func attack() -> Bool {
        return true
    }
}

class Weapon : WeaponProtocol {
    var damage: Int
    required init() {
        self.damage = Int.random(in: 30...50)
       }
    func attack() -> Bool {
        return true
    }
}

//MARK: Monster
protocol MonsterProtocol {
    var health: Int { get set }
    
    init()
    
    func hitChance(damage: Int) -> Bool
    
    func die() -> Bool
}

class Monster :  MonsterProtocol {
    
    var health: Int
    
    required init() {
        self.health = Int.random(in: 30...50)
    }
    
    func hitChance(damage: Int) -> Bool {
        if health <= damage {
            self.health = 0
        } else {
            self.health -= damage
        }
        return die()
    }
    
    func die() -> Bool {
        
        if self.health == 0 {
            return  true
        }
        return false
    }
    
    
}

    


