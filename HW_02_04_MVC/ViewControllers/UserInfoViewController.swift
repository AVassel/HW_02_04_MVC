//
//  UserInfoViewController.swift
//  HW_02_04_MVC
//
//  Created by Anton Vassel on 14.04.2022.
//

import UIKit

class UserInfoViewController: UIViewController {
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(user.person.firstName) \(user.person.surname)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let ImageVC = segue.destination as? ImageViewController else { return }
        ImageVC.user = user
    }
}
