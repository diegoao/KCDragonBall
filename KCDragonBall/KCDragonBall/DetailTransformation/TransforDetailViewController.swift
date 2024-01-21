//
//  TransforDetailViewController.swift
//  KCDragonBall
//
//  Created by Macbook Pro on 20/1/24.
//

import UIKit

class TransforDetailViewController: UIViewController {
    
    // MARK: - Outlets

    @IBOutlet weak var TransforNameLabel: UILabel!
    
    @IBOutlet weak var TransfoImageView: UIImageView!
    
    @IBOutlet weak var DescriptionLabel: UITextView!
    //MARK: - Model
    
    private let heroe: DGHeroTransformation
    
    // MARK: - Initializers
    init(heroe: DGHeroTransformation){
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
        
        }
}



// MARK: - View Configuration
private extension TransforDetailViewController {
    func configureView() {
        
        TransforNameLabel.text = heroe.name
        DescriptionLabel.text = heroe.description
        guard let imageURL = URL(string: heroe.photo) else {
            return
        }
        TransfoImageView.setImage(url: imageURL)
    }
}
