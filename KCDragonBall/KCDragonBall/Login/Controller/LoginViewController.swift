//
//  LoginViewController.swift
//  KCDragonBall
//
//  Created by Macbook Pro on 15/1/24.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    // MARK: - Model
    private let model = NetworkModel.shared
        
    // MARK: - Acciones
    
    @IBAction func didTapContinueButton( _ sender: Any ){
        model.login(
            user: emailTextField.text ?? "",
            password: passwordTextField.text ?? ""
        ) { [weak self] result in
            guard let self else { return }
            switch result {
                case let .success(token):
                    // Navega al ViewController de Heroes
                print(token)
                    break
                case let .failure(error):
                    print("🔴 \(error)")
            }
        }
    }
}

