//
//  ViewController1.swift
//  JsonNew
//
//  Created by CHRISTIAN BEYNIS on 7/19/22.
//

import Foundation

import UIKit

class ViewController1: UIViewController {

    var indexP = 0

    lazy var progImageView2: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleToFill
        
        imageView.image = UIImage(named: "PokeImg")
        return imageView
        
    }()
    
    lazy var Name: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = label.font.withSize(12)
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        //label.text = "Pokemon_Name"
        //label.backgroundColor = .systemOrange
        return label
    }()
    
    lazy var Types: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = label.font.withSize(12)
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.text = "Pokemon_type"
        //label.backgroundColor = .systemOrange
        return label
    }()
    
    
    lazy var Abilities: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = label.font.withSize(12)
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.text = "Pokemon_Abilities"
//        label.backgroundColor = .systemOrange
        return label
    }()
    
    lazy var MovesList: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.font = label.font.withSize(12)
        label.setContentHuggingPriority(.required, for: .vertical)
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.text = "Pokemon_Moves"
//        label.backgroundColor = .systemOrange
        return label
    }()

    let network = NetworkManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemTeal
        self.setUpUI()
        self.SetLabels()
        self.setImages()
        // Do any additional setup after loading the view.
    }

    private func setUpUI() {
        
        
    


//        let hStack = UIStackView(axis: .horizontal, spacing: 5 , distribution: .fillProportionally)
//        let vStackName = UIStackView(axis: .vertical, spacing: 5 , distribution: .fillProportionally)
////
////
//        vStackName.addArrangedSubview(self.Name)
//        vStackName.addArrangedSubview(self.Types)
//        vStackName.addArrangedSubview(self.progImageView2)
//        vStackName.addArrangedSubview(self.Abilities)
//        vStackName.addArrangedSubview(self.MovesList)
//
//        hStack.addArrangedSubview(vStackName)
//        hStack.bindToSuperView()
        
        
        
//        let hStack = UIStackView(axis: .vertical , spacing: 8, distribution: .fill)
//        let vStack = UIStackView(axis: .vertical , spacing: 8, distribution: .fill)
//
//        vStack.addSubview(self.Name)
//        vStack.addArrangedSubview(self.Types)
//        vStack.addArrangedSubview(self.progImageView2)
//        vStack.addArrangedSubview(self.Abilities)
//        vStack.addArrangedSubview(self.MovesList)
//
//
//
//        hStack.addArrangedSubview(vStack)
//
//        self.contentView.addSubview(hStack)
//        vStack.bindToSuperView()


        self.view.addSubview(self.Name)
        self.view.addSubview(self.progImageView2)
        self.view.addSubview(self.Types)
        self.view.addSubview(self.Abilities)
        self.view.addSubview(self.MovesList)


        self.Name.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true


        self.Name.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true

        self.progImageView2.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 80).isActive = true

        self.progImageView2.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.progImageView2.heightAnchor.constraint(equalToConstant: 300).isActive = true
        self.progImageView2.widthAnchor.constraint(equalToConstant: 300).isActive = true

        self.Types.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 32).isActive = true

        self.Types.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true

        self.Abilities.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 56).isActive = true

        self.Abilities.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true

        self.MovesList.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true
        self.MovesList.centerYAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerYAnchor, constant: 200).isActive = true
        self.MovesList.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true

        self.MovesList.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.MovesList.centerXAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.centerXAnchor).isActive = true





        
        
    

        
        
        
    }
    
//    func setLabels(){
//
//        let pokemon = network.getData(url:"https://pokeapi.co/api/v2/pokemon/"+"\(indexP+1)"+"/")
//        guard let pokemon = pokemon else { return }
//        let name = String("\(pokemon[String(indexP+1)]![0])")
//        self.Name.text = "Name: " + name
//        let abilities = String("\(pokemon[String(indexP+1)]![1])")
//        self.Abilities.text = "Abilities: " + abilities
//        let type = String("\(pokemon[String(indexP+1)]![2])")
//        self.Types.text = "Types: " + type
//        let moves = String("\(pokemon[String(indexP+1)]![4])")
//        self.MovesList.text = "moves: " + moves
//    }
    
    func setImages (){
        
        self.network.fetchImageData(urlStr: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"+String(indexP+1)+".png"){
            result in switch result{
                
            case .success (let imageData):
                DispatchQueue.main.async{
                    self.progImageView2.image = UIImage(data: imageData)
                }
                
            case .failure(let error):
                print(error)

            
            
            
            }
            
        }
        
    }
    
    func SetLabels (){
        
        self.network.fetchPageData_int(val: self.indexP){
            result in switch result{

            case .success (let page):

                print("Ok")

                DispatchQueue.main.async{
                    //print(page, "Heeeeeerrrrreee")
//                  let pokemon = page
//                    self.presentPokemonAlert(pokemon: page)
                    
                    
                    print("oookkkkkkkkkkkkkkkkkkkkk")
                    
                    print("hhhhhhhhhhheeeeeeeeerrrrre")
                    self.Name.text = page.name
                    
                    let types = page.types.compactMap{$0.type.name}.reduce(""){
                        partialResult, move in
                        return partialResult + move + "\n"
                    }
                    
                    let abilities = page.abilities.compactMap{$0.ability.name}.reduce(""){
                        partialResult, move in
                        return partialResult + move + "\n"
                    }
                    
                    let moves = page.moves.compactMap { $0.move.name }.reduce("") { partialResult, move in
                        return partialResult + move + "\n"
                    }
                    
                    print(page.abilities)
                    
                    
                    self.Types.text = types
                    self.Abilities.text = abilities
                    self.MovesList.text = moves
                    
                }

            case .failure(let error):
                print(error)
            }
        
            
        }
        
        
    }
    
    
    
    }
