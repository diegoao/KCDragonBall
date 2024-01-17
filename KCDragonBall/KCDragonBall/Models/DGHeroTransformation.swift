//
//  DGHeroTransformation.swift
//  KCDragonBall
//
//  Created by Macbook Pro on 15/1/24.
//

import Foundation

// Con postman hago una petición a la api, luego me voy a la web
// Quicktype y pego el archivo json. me devuelve la estructura que necesito

// MARK: - HeroTransformation
struct DGHeroTransformation: Codable {
    let name: String
    let photo: String
    let id, description: String
}


