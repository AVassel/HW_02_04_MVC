//
//  WelcomeViewController.swift
//  HW_02_04_MVC
//
//  Created by Anton Vassel on 14.04.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var greetingLabel: UILabel!

    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        greetingLabel.text = "Greeting, \(user.person.fullName)"
    }
}
