//
//  ViewController.swift
//  HW_02_04_MVC
//
//  Created by Anton Vassel on 14.04.2022.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var loginTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    
    private let user = User.getUser()
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        prepareToLoad()
        
        guard let tapBarController = segue.destination as? UITabBarController else { return }
        guard let viewControllers = tapBarController.viewControllers else { return }
        
        for viewController in viewControllers {
            if let welcomeVC = viewController as? WelcomeViewController {
                welcomeVC.user = user
            }
            else if let navigationVC = viewController as? UINavigationController {
                let userInfoVC = navigationVC.topViewController as! UserInfoViewController
                userInfoVC.user = user
            }
        }
    }
    
    private func prepareToLoad() {
        if loginTF.text != user.userLogin || passwordTF.text != user.userPassword {
            showAlert(with: "Ahtung!!!", and: "Неверно указано имя пользователя или пароль!")
        }
    }
    
    @IBAction func forgotPassButtonPressed() {
        showAlert(with: "Забыли пароль?", and: "А он - \(user.userPassword)")
    }
    
    @IBAction func forgotUserButtonPressed() {
        showAlert(with: "Забыли имя пользователя?", and: "А оно - \(user.userLogin)")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        loginTF.text = ""
        passwordTF.text = ""
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == loginTF { passwordTF.becomeFirstResponder()
        } else {
            prepareToLoad()
            performSegue(withIdentifier: "WelcomeViewController", sender: nil)
        }
        return true
    }
}

extension LoginViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            self.passwordTF.text = ""
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

