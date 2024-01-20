//
//  DetailTransformationViewController.swift
//  KCDragonBall
//
//  Created by Macbook Pro on 20/1/24.
//



import UIKit

final class DetailTrasnformationViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var transformationNameLabel: UILabel!
    @IBOutlet weak var transformationTextLabel: UITextView!
    @IBOutlet weak var transformationImage: UIImageView!
    
    
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
 extension DetailTrasnformationViewController {
    func configureView() {

        transformationNameLabel.text = heroe.name
        transformationTextLabel.text = heroe.description

        }
    }



