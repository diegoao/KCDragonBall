//
//  HeroTableViewCell.swift
//  KCDragonBall
//
//  Created by Macbook Pro on 16/1/24.
//

import UIKit

final class HeroTableViewCell: UITableViewCell {
    // MARK: - Identifier
    static let identifier = "HeroTableViewCell"
    
    // MARK: - Outlets
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroImageView: UIImageView!
    
    
    
    // MARK: - Configure
    func configure(with hero: DragonBallHero){
        heroNameLabel.text = hero.name
        guard let imageURL = URL(string: hero.photo) else {
            return
        }
        heroImageView.setImage(url: imageURL)
    }
}
