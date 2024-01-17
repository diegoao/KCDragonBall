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
            switch result {
                case let .success(token):
                    DispatchQueue.main.async {
                        let heroesListViewController = HeroListTableViewController()
                        self?.navigationController?.setViewControllers([heroesListViewController], animated: true)
                    }
                case let .failure(error):
                    print("🔴 \(error)")
            }
        }
    }
}

