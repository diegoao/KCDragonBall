//
//  TransformationTableViewCell.swift
//  KCDragonBall
//
//  Created by Macbook Pro on 18/1/24.
//

import UIKit

class TransformationTableViewCell: UITableViewCell {
    // MARK: - Identifier
    static let identifier = "TransformationTableViewCell"
    // MARK: - Outlets
   
    @IBOutlet weak var transforImageView: UIImageView!
    @IBOutlet weak var TransfoText: UILabel!
    
    // MARK: - Configure
    
    // MARK: - Configure
    func configure(with hero: DGHeroTransformation){
        TransfoText.text = hero.name
        guard let imageURL = URL(string: hero.photo) else {
            return
        }
    transforImageView.setImage(url: imageURL)
    }
}
