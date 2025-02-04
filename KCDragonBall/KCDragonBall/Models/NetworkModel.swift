//
//  NetworkModel.swift
//  KCDragonBall
//
//  Created by Macbook Pro on 15/1/24.
//

import Foundation

final class NetworkModel{
    
    static let shared = NetworkModel()
    
    
    private var token: String? {
        get {
            if let token = LocalDataModel.getToken(){
                return token
            }
            return nil
        }
        set {
            if let token = newValue{
            LocalDataModel.save(token: token)
            }
        }
    }
    

    private var baseComponents: URLComponents {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "dragonball.keepcoding.education"
        return components
    }

    private let client: APIClientProtocol


    // Ponemos el inicializador privado, para prevenir
    // que NetworkModel sea instanciado desde fuera.
    init(client: APIClientProtocol = APIClient()) {
        self.client = client
    }
    
    func login(
        user: String,
        password: String,
        completion: @escaping (Result<String, KCDragonBallError>)-> Void
    
    ){
        var components = baseComponents
        components.path = "/api/auth/login"
        
        guard let url = components.url else {
            completion(.failure(.malformedURL))
            return
        }
        
        // Creo un string con el formato %@:%@
        // Ej: die_94_go@hotmail.com:12345678
        let loginString = String(format: "%@:%@", user, password)
        // Encodificamos el login string a un objeto data
        guard let loginData = loginString.data(using: .utf8) else{
            completion(.failure(.encondingfailed))
            return
        }
        
        // Encodificamos la string con un algoritmo criptografico
        // en base 64
        let base64LoginString = loginData.base64EncodedString()
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        
        client.jwt(urlRequest) { [weak self] result in
            switch result{
            case let.success(token):
                self?.token = token
                completion(.success(token))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    func getHeroes(
        completion: @escaping (Result<[DragonBallHero], KCDragonBallError>) -> Void
    ) {
        var components = baseComponents
        components.path = "/api/heros/all"
        guard let url = components.url else {
            completion(.failure(.malformedURL))
            return
        }
        
        guard let token else {
            completion(.failure(.unknown))
            return
        }
        
        // Crear un objeto URLComponents, para encodificarlo posteriormente
        var urlComponents = URLComponents()
        urlComponents.queryItems = [URLQueryItem(name: "name", value: "")]
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        // Encodificamos el query item de url components
        urlRequest.httpBody = urlComponents.query?.data(using: .utf8)
        
        client.request(urlRequest, using: [DragonBallHero].self, completion: completion)
    }
    
    func getTrasnformation( id: String,
        completion: @escaping (Result<[DGHeroTransformation], KCDragonBallError>) -> Void
    ) {
        var components = baseComponents
        components.path = "/api/heros/tranformations"
        guard let url = components.url else {
            completion(.failure(.malformedURL))
            return
        }
        
        guard let token else {
            completion(.failure(.unknown))
            return
        }
        
        // Crear un objeto URLComponents, para encodificarlo posteriormente
        var urlComponents = URLComponents()
        urlComponents.queryItems = [URLQueryItem(name: "id", value: id)]
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        // Encodificamos el query item de url components
        urlRequest.httpBody = urlComponents.query?.data(using: .utf8)
        
        client.request(urlRequest, using: [DGHeroTransformation].self, completion: completion)
    }
}
