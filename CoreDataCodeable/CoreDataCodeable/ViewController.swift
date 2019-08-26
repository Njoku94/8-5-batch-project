//
//  ViewController.swift
//  CoreDataCodeable
//
//  Created by Brian Njoku on 8/21/19.
//  Copyright © 2019 Brian Njoku. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
@IBOutlet weak var pokemonTableView: UITableView!
override func viewDidLoad() {
        super.viewDidLoad()
    pokemonTableView.dataSource = self
    pokemonTableView.register(UITableViewCell.self, forCellReuseIdentifier: "pokecell")
    let randomPokemonNumber = Int.random(in: 1...807)
    var pokemonArray: [Pokemon] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokemonTableView.dataSource = self
        pokemonTableView.register(UITableViewCell.self, forCellReuseIdentifier: "pokecell")
        let randomPokemonNumber = Int.random(in: 1...807)
        guard let pokeURL = URL(string: "https://pokeapi.co/api/v2/pokemon/\(randomPokemonNumber)") else {
            return }
        URLSession.shared.dataTask(with: pokeURL) { (data,_,_ ) in
            guard let data = data,
                let pokemon = try? JSONDecoder().decode(Pokemon.self, from: data) else {return}
            self.pokemonArray.append(pokemon)
            do {
                try CoreDataManager.shared.context.save()
            } catch {
                print(error.localizedDescription)
            }
            DispatchQueue.main.async {
                self.pokemonArray = CoreDataManager.shared.getAllPokemon()
                self.pokemonTableView.reloadData()
            }
            }.resume()
    }
    }
    
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonArray.count
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "pokecell")
        cell.textLabel?.text = pokemonArray[indexPath.row].name
        return cell
    }
}
