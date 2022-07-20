//
//  ViewController.swift
//  JsonNew
//
//  Created by CHRISTIAN BEYNIS on 7/18/22.
//

import UIKit

class ViewController: UIViewController {

   
    
    lazy var decodableDecodeButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Decodable Decode Data", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15.0
        button.addTarget(self, action: #selector(self.decodableButtonPressed), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true
        return button
    }()
    
    
    let network = NetworkManager()
//    var pokemon : Pokemon = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.decodableDecodeButton)
       
        
        self.decodableDecodeButton.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.decodableDecodeButton.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: -50).isActive = true
        self.decodableDecodeButton.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.decodableDecodeButton.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
       
    }
    
    @objc
    func decodableButtonPressed() {
        
        
        self.network.fetchPage(urlStr: "https://pokeapi.co/api/v2/pokemon/1/"){
            result in switch result{

            case .success (let page):

                print(page)

                DispatchQueue.main.async{
                    print(page)
//                  let pokemon = page
                    self.presentPokemonAlert(pokemon: page)
                }

            case .failure(let error):
                print(error)
            }
        
            
        }
        
        
    }
    
    
    func presentPokemonAlert(pokemon: Pokemon?) {
        guard let pokemon = pokemon else { return }
        
        let moves = pokemon.moves.compactMap { $0.move.name }.reduce("") { partialResult, move in
            return partialResult + move + "\n"
        }
        
        
        let abilitities_ = pokemon.abilities.compactMap{$0.ability.name}.reduce(""){
            partialResult, move in
            return partialResult + move + "\n"
        }
        
        let types = pokemon.types.compactMap{$0.type.name}.reduce(""){
            partialResult, move in
            return partialResult + move + "\n"
        }
        
        
        
        
        let alert = UIAlertController(title: pokemon.name, message: abilitities_, preferredStyle: .alert)
        let action = UIAlertAction(title: "Sounds Good", style: .default, handler: nil)
        alert.addAction(action)
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    
}


