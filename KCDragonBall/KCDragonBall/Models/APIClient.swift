//
//  APIClient.swift
//  KCDragonBall
//
//  Created by Macbook Pro on 15/1/24.
//

import Foundation


// MARK: - Error Custom

enum KCDragonBallError: Error{
    case noData
    case malformedURL
    case statusCode(code: Int?)
    case decodingFailed
    case encondingfailed
    case unknown
}

extension KCDragonBallError {
    static func error(for code: Int) -> KCDragonBallError? {
        switch code {
            case 0: return .statusCode(code: nil)
            case 1: return .malformedURL
            case 2: return .noData
            case 3: return .statusCode(code: 400)
            case 4: return .decodingFailed
            case 5: return .unknown
            default: return nil
        }
    }
}


// MARK: - API

protocol APIClientProtocol{
    
    var session: URLSession {get}
    
    func request<T: Decodable>(
        _ request: URLRequest,
        using type: T.Type,
        completion: @escaping (Result<T, KCDragonBallError>) -> Void
    )
    
    func jwt(
    _ request: URLRequest,
    completion: @escaping (Result<String, KCDragonBallError>)-> Void
    )
}


struct APIClient: APIClientProtocol{
    let session: URLSession
    
    init(session: URLSession = .shared) {
        self.session = session
    }
    
    func request<T: Decodable>(
        _ request: URLRequest,
        using type: T.Type,
        completion: @escaping (Result<T, KCDragonBallError>) -> Void
    ){
        session.dataTask(with: request) {data, response, error in
            let result: Result<T, KCDragonBallError>
            
            // Se ejecuta al final de la función
            defer {
                completion(result)
            }
            
            guard error == nil else{
                if let error = error as? NSError,
                   let error = KCDragonBallError.error(for: error.code) {
                    result = .failure(error)
                }else{
                    result = .failure(.unknown)
                }
                return
            }
            
            guard let data else {
                result = .failure(.noData)
                return
            }
            
            let statuCode = (response as? HTTPURLResponse)?.statusCode
            
            guard statuCode == 200 else {
                result = .failure(.statusCode(code:statuCode))
                return
            }
            
            guard let resource = try? JSONDecoder().decode(type, from: data)
                else{
                result = .failure(.decodingFailed)
                return
            }
            
            result = .success(resource)
        }
        .resume()
    }
    
    func jwt(
        _ request: URLRequest,
        completion: @escaping (Result<String, KCDragonBallError>) -> Void
    ) {
        session.dataTask(with: request) { data, response, error in
            let result: Result<String, KCDragonBallError>
            
            defer {
                completion(result)
            }
            
            guard error == nil else {
                if let error = error as? NSError,
                    let error = KCDragonBallError.error(for: error.code) {
                    result = .failure(error)
                } else {
                    result = .failure(.unknown)
                }
                return
            }
            
            guard let data else {
                result = .failure(.noData)
                return
            }
            
            let statusCode = (response as? HTTPURLResponse)?.statusCode
            
            guard statusCode == 200 else {
                result = .failure(.statusCode(code: statusCode))
                return
            }
            
            guard let jwt = String(data: data, encoding: .utf8) else {
                result = .failure(.decodingFailed)
                return
            }
            
            result = .success(jwt)
        }
        .resume()
    }
}

    
