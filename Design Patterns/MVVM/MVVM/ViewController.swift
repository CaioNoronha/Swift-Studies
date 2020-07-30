//
//  ViewController.swift
//  MVVM
//
//  Created by Caio Carvalho de Noronha on 18/02/20.
//  Copyright © 2020 caivis. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let model = Person(firstName: "Caio", lastName: "Noronha")
        let viewModel = GreetingViewModel(person: model)
        let view = GreetingViewController()
        view.viewModel = viewModel
        view.viewModel.showGreeting()
    }
}

