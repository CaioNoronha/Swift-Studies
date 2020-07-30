//
//  View.swift
//  MVVM
//
//  Created by Caio Carvalho de Noronha on 18/02/20.
//  Copyright © 2020 caivis. All rights reserved.
//

import UIKit

class GreetingViewController : UIViewController {
    var viewModel: GreetingViewModelProtocol! {
        didSet {
            self.viewModel.greetingDidChange = { [unowned self] viewModel in
                self.greetingLabel.text = viewModel.greeting
            }
        }
    }
    let showGreetingButton = UIButton()
    let greetingLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.showGreetingButton.addTarget(self.viewModel, action: Selector(("showGreeting")), for: .touchUpInside)
    }
}
