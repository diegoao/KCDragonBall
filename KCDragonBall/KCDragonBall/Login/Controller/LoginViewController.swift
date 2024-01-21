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
    @IBOutlet weak var MessageErrorView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        MessageErrorView.isHidden = true
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
                    _ = token
                    DispatchQueue.main.async {
                        let heroesListViewController = HeroesListTableViewController()
                        self?.navigationController?.setViewControllers([heroesListViewController], animated: true)
                    }
                case let .failure(error):
                    DispatchQueue.main.async {
                        self?.MessageErrorView.isHidden = false
                    }
                    print("🔴 \(error)")
            }
        }
    }
}

