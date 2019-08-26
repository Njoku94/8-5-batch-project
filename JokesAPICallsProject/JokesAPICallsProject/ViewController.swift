//
//  ViewController.swift
//  JokesAPICallsProject
//
//  Created by BrianNjoku on 8/26/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    var jokeArray: [Joke] = []
    var displayArray: [Joke] = []
    var favoriteArray: [Joke] = JokeDataManager.shared.getAllJokes()
    var favorite = false
    
    var myCase = 0
    
    @IBOutlet weak var jokeTableView: UITableView!
    @IBOutlet weak var categorySegmentedControl: UISegmentedControl!
    
    @IBAction func getNewJoke(_ sender: Any) {
        
        URLSession.shared.dataTask(with: URL(string: "https://sv443.net/jokeapi/category/Any")!) { (data, _, _) in
            guard let data = data else { return }
            guard let joke = try? JSONDecoder().decode(Joke.self, from: data) else {
                return
            }
            self.jokeArray.append(joke)
            self.displayArray = self.jokeArray
            }.resume()
        DispatchQueue.main.async{
            self.jokeTableView.reloadData()
        }
    }
    
    func makeProgrammingJokes( defaultJoke: [Joke]) -> [Joke] {
        var programmingArray: [Joke] = []
        for elements in defaultJoke {
            if elements.category == "Programming" {
                programmingArray.append(elements)
            }
        }
        return programmingArray
    }
    
    func makeDarkJokes( defaultJoke: [Joke] ) -> [Joke] {
        var darkArray: [Joke] = []
        for elements in defaultJoke {
            if elements.category == "Funny" {
                darkArray.append(elements)
            }
        }
        return darkArray
    }
    
    func makeMiscellaneosJokes( defaultJoke: [Joke]) -> [Joke] {
        var miscellaneousArray: [Joke] = []
        for elements in defaultJoke {
            if elements.category == "Miscellaneous" {
                miscellaneousArray.append(elements)
            }
        }
        return miscellaneousArray
    }
    
    @IBAction func categorySegmentedControl(_ sender: Any) {
        
        switch categorySegmentedControl.selectedSegmentIndex {
        case 0:
            displayArray = jokeArray
            jokeTableView.reloadData()
        case 1:
            displayArray = makeProgrammingJokes(defaultJoke: jokeArray)
            jokeTableView.reloadData()
        case 2:
            displayArray = makeMiscellaneosJokes(defaultJoke: jokeArray)
            jokeTableView.reloadData()
        case 3:
            displayArray = makeDarkJokes(defaultJoke: jokeArray)
            jokeTableView.reloadData()
        case 4:
            displayArray = favoriteArray
            jokeTableView.reloadData()
        default:
            break
        }
    }
    
    func isFavorite(checkJoke: Joke, defalultJokes: [Joke]) -> Bool {
        
        var favorite = false
        
        for elements in defalultJokes {
            if elements.type == "single" {
                if elements.joke == checkJoke.joke {
                    favorite = true
                }
            } else if elements.type == "twopart" {
                if elements.setup == checkJoke.setup {
                    favorite = true
                }
            }
        }
        return favorite
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jokeTableView.dataSource = self
        jokeTableView.delegate = self
        jokeTableView.register(UINib.init(nibName: "JokesTableViewCell", bundle: nil), forCellReuseIdentifier: "jokecell")
        
        favoriteArray = JokeDataManager.shared.getAllJokes()
        
        switch categorySegmentedControl.selectedSegmentIndex {
        case 0:
            displayArray = jokeArray
        case 1:
            displayArray = makeProgrammingJokes(defaultJoke: jokeArray)
        case 2:
            displayArray = makeMiscellaneosJokes(defaultJoke: jokeArray)
        case 3:
            displayArray = makeDarkJokes(defaultJoke: jokeArray)
        case 4:
            displayArray = favoriteArray
        default:
            break
        }
    }

}

extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return displayArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "jokecell", for: indexPath) as! JokesTableViewCell
        cell.textLabel?.numberOfLines = 0
        
        cell.textLabel?.text = "Single: \(displayArray[indexPath.row].joke ?? "Its a joke with two parts")" +
            "/Twopart Setup: \(displayArray[indexPath.row].setup ?? "Its a joke with a single part")" +
            "/Delivery: \(displayArray[indexPath.row].delivery ?? "None")"
        
        print(cell.cellJokeSearch)
        favorite = isFavorite(checkJoke: displayArray[indexPath.row], defalultJokes: favoriteArray)
    
        cell.favorite = favorite
        //cell.cellJokeSearch = displayArray[indexPath.row]
        cell.cellCategory = displayArray[indexPath.row].category
        cell.cellType = displayArray[indexPath.row].type
        
        if displayArray[indexPath.row].type == "single" {
            cell.cellJoke = displayArray[indexPath.row].joke
            cell.cellSetup = ""
            cell.cellDelivery = ""
        } else {
            cell.cellJoke = ""
            cell.cellSetup = displayArray[indexPath.row].setup
            cell.cellDelivery = displayArray[indexPath.row].delivery
        }
        
        return cell
    }
}


