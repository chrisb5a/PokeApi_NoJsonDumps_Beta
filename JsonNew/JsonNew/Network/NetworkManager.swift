//
//  NetworkManager.swift
//  JsonNew
//
//  Created by CHRISTIAN BEYNIS on 7/18/22.
//

import Foundation

class NetworkManager {
    
    
    
    
    let session: URLSession
    
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func getData(url: URL?, completion: @escaping (Result<Data, NetworkError>) -> Void) {
        
        func fetchPage(urlStr: String, completion: @escaping (Result<Pokemon, Error>) -> Void) {

            guard let url = URL(string: urlStr) else {
                // completion error
                return
            }
            
            self.session.dataTask(with: url) { data, response, error in
                
                // Do error handling
                
                guard let data = data else {
                    // return error
                    return
                }
                
                
                do {
                    let page = try JSONDecoder().decode(Pokemon.self, from: data)
                    print(page)
                    
                    completion(.success(page))
                } catch {
                    print("error")
                    completion(.failure(error))
                }

            }.resume()

        }
        
        
        
    }
    
    func fetchPage(urlStr: String, completion: @escaping (Result<Pokemon, Error>) -> Void) {

        guard let url = URL(string: urlStr) else {
            // completion error
            return
        }
        
        self.session.dataTask(with: url) { data, response, error in
            
            // Do error handling
            
            guard let data = data else {
                // return error
                return
            }
            
            
            do {
                let page = try JSONDecoder().decode(Pokemon.self, from: data)
                completion(.success(page))
            } catch {
                completion(.failure(error))
            }

        }.resume()

    }
    
    
    
    func fetchImageData(urlStr: String, completion: @escaping (Result<Data, NetworkError>)-> Void){
        guard let url = URL(string: urlStr) else {
            completion(.failure(NetworkError.badURL))
            return
        }

        self.session.dataTask(with: url) { data, response, error in
            
            if let error = error {
                completion(.failure(NetworkError.other(error)))
                return
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.badData))
                return
            }
            
            completion(.success(data))
        }.resume()
        
    }
    
    
    func fetchPageData_int(val: Int, completion: @escaping (Result<Pokemon, Error>) -> Void) {
        
        
        let urlStr = "https://pokeapi.co/api/v2/pokemon/" + "\(val+1)" + "/"

        guard let url = URL(string: urlStr) else {
            // completion error
            return
        }
        
        self.session.dataTask(with: url) { data, response, error in
            
            // Do error handling
            
            guard let data = data else {
                // return error
                return
            }
            
            
            do {
                let page = try JSONDecoder().decode(Pokemon.self, from: data)
                completion(.success(page))
            } catch {
                completion(.failure(error))
            }

        }.resume()

    }
    
    
    
    
    
//    let urlStr = "https://pokeapi.co/api/v2/pokemon/"+"\(val)"+"/"
//
//    guard let url = URL(string: urlStr) else {
//        // completion error
//        return
//    }
//
//    self.session.dataTask(with: url) { data, response, error in
//
//        // Do error handling
//
//        guard let data = data else {
//            // return error
//            return
//        }
//
//
//        do {
//            let page = try JSONDecoder().decode(Pokemon.self, from: data)
//
//            completion(.success(page))
//
//
//
//            return p
//
//
//
//        } catch {
//
//            completion(.failure(error))
//        }
//
//    }.resume()

    
    
    
}
    
    
