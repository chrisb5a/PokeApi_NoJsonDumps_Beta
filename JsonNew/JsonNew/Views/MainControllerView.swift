//
//  MainControllerView.swift
//  JsonNew
//
//  Created by CHRISTIAN BEYNIS on 7/18/22.
//

import UIKit



class MainViewController: UIViewController {
    
    var data_: [Pokemon] = []
    let network: NetworkManager = NetworkManager()
    var PokePics: [UIImage] = []
    var PokePics1: [Int] = []
    var currentPage = 0
    var imageCache: [Int: Data] = [:]
    
    lazy var PokeTable: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.backgroundColor = .systemCyan
        table.delegate = self
        table.prefetchDataSource = self
        // Register
        table.register(ProgTableViewCell.self, forCellReuseIdentifier: ProgTableViewCell.reuseID)
        return table
    }()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        self.setUpUI()
        self.requestPage()
        
        
    }
    
    private func setUpUI(){
        self.view.addSubview(self.PokeTable)
        self.PokeTable.bindToSuperView()
    
    }
    
    private func requestPage(){
        
        for i in 1...150{
            PokePics1.append(i)
        }
        
        
        self.network.fetchPageData_int(val: self.currentPage+1){
            result in switch result{

            case .success (let page):

                print("Ok")

                DispatchQueue.main.async{
                    //print(page, "Heeeeeerrrrreee")
                    let pokemon = page
//                    self.presentPokemonAlert(pokemon: page)

                    self.data_ = [page]
                    print("oookkkkkkkkkkkkkkkkkkkkk")
                    print(self.data_[0].name)
                    print("hhhhhhhhhhheeeeeeeeerrrrre")
                    
                    //self.PokeTable.reloadData()
                    
                    
                    
                }

            case .failure(let error):
                print(error)
            }


        }
        
        let url_left = "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"
        let url_right = ".png"
        var url_middle = String(self.currentPage+1)
        
        
        
        self.network.getData(url: URL(string: url_left + url_middle + url_right)){
            result in
            
            switch result{
            case .success(let data):
                self.currentPage += 1
                self.PokePics.append(UIImage(data: data) ?? UIImage(named:"Mean_1000")!)
                DispatchQueue.main.async {
                    self.PokeTable.reloadData()
                }
            case .failure(let error):
                print(error)
            
            }
        }
        
        
        
        
    }
}




extension MainViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.PokePics1.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ProgTableViewCell.reuseID, for: indexPath) as? ProgTableViewCell else{
            return UITableViewCell()
        }
        
        cell.configure(Pokepics: UIImage())
        self.network.fetchPageData_int(val: indexPath.row){
            result in switch result{

            case .success (let page):

                print("Ok")

                DispatchQueue.main.async{
                    //print(page, "Heeeeeerrrrreee")
//                  let pokemon = page
//                    self.presentPokemonAlert(pokemon: page)
                    
                    self.data_ = [page]
                    print("oookkkkkkkkkkkkkkkkkkkkk")
                    print(self.data_[0].name)
                    print("hhhhhhhhhhheeeeeeeeerrrrre")
        
                    let name = page.species.name
                    cell.titleLabel.text = name
                    
                    
                    let types = page.types.compactMap{$0.type.name}.reduce(""){
                        partialResult, move in
                        return partialResult + move + "\n"
                    }
                    
                    
                    
                    
                    cell.overviewLabel.text = types
                }

            case .failure(let error):
                print(error)
            }
        
            
        }

        
       
        
        self.network.fetchImageData(urlStr: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/"+String(self.PokePics1[indexPath.row])+".png"){
            result in switch result{
                
            case .success (let imageData):
                DispatchQueue.main.async{
                    //print("Image pulled from network")
                    self.imageCache[self.PokePics1[indexPath.row]] = imageData
                    cell.pokeImageView.image = UIImage(data: imageData)
                }
                
            case .failure(let error):
                print(error)

            
            
            
            }
            
        }
        return cell
    }
}
    
extension MainViewController: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailVc = ViewController1()
        self.navigationController?.pushViewController(detailVc, animated: true)
        detailVc.indexP = indexPath.row
        print( "HHHHHHHHHHHHHHHHHHHHHEEeeeeeeeeeeerrrrrrrrrreeeeee")
    }

}

extension MainViewController: UITableViewDataSourcePrefetching {
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        let lastIndexPath = IndexPath(row: self.PokePics.count - 30, section :0)
        guard indexPaths.contains(lastIndexPath) else {return}
        self.requestPage()
    }
        
        
    }



