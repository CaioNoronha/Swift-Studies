//
//  ViewController.swift
//  RPGNano
//
//  Created by Caio Carvalho de Noronha on 30/09/19.
//  Copyright © 2019 caivis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let dataSource = ["Espada pequena", "Espada Média", "Espada Grande", "Espada Gigante", "Machado", "Porrete", "Pistola", "Rifle", "Bastão", "Clava", "Lança"]
    @IBOutlet weak var weaponPicker: UIPickerView!
    @IBOutlet weak var weaponImage: UIImageView!
    
    var textName = "Espada pequena"
    var weaponDamage = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addWeaponNames()
        // Do any additional setup after loading the view.
    }
    
    func addWeaponNames() {
        weaponPicker.dataSource = self
        weaponPicker.delegate  = self
    }
    
    @IBAction func createWeapon(_ sender: Any) {
        let weapon = Weapon()
        performSegue(withIdentifier: "nextPageSegue", sender: nil)
        weaponDamage = weapon.damage
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "nextPageSegue" {
            let segueDst = segue.destination as! ResultadoViewController
            segueDst.imageWeapon = self.weaponImage.image ?? UIImage(named:"1")!
            segueDst.weaponName = self.textName + " \(weaponDamage) de Dano!"
            segueDst.damage = weaponDamage
        }
    }
    
}

extension ViewController : UIPickerViewDelegate,  UIPickerViewDataSource {
       
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return  dataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        weaponImage.image = UIImage(named: "\(row + 1)")
        textName = dataSource[row]
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return dataSource[row]
    }
       
   }

