//
//  DetailHeroesViewController.swift
//  KCDragonBall
//
//  Created by Macbook Pro on 17/1/24.
//

import UIKit

class DetailHeroesViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroImageView: UIImageView!
    @IBOutlet weak var heroTextDescription: UITextView!
    @IBOutlet weak var transformationButton: UIButton!
    
    
    //MARK: - Model
    
    private let heroe: DragonBallHero
    
    // MARK: - Initializers
    init(heroe: DragonBallHero){
        self.heroe = heroe
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        transformationButton?.isHidden = false
    }
    

    // MARK: - Model
    private let model = NetworkModel.shared
    
    @IBAction func transformationButton(_ sender: Any) {
                DispatchQueue.main.async {
                    let transformationListViewController = TransformationTableViewController()
                    self.navigationController?.setViewControllers([transformationListViewController], animated: true)
                }
            }
}



// MARK: - View Configuration
private extension DetailHeroesViewController {
    func configureView() {
        heroNameLabel.text = heroe.name
        heroTextDescription.text = heroe.description
        guard let imageURL = URL(string: heroe.photo) else {
            return
        }
        heroImageView.setImage(url: imageURL)
        
    }
}





