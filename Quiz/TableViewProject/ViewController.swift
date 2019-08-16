//
//  ViewController.swift
//  TableViewProject
//
//  Created by MAC on 8/16/19.
//  Copyright © 2019 BrianNjoku. All rights reserved.
//

import UIKit

class ViewController: UIViewController{
  @IBOutlet weak var theTableView: UITableView!
    var episodeArray: [Episode] = []
  
  override func viewDidLoad() {
    super.viewDidLoad()
    theTableView.dataSource = self
    theTableView.delegate = self
    theTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    
    URLSession.shared.dataTask(with: URL(string: "https://api.tvmaze.com/shows/82?embed=seasons&embed=episodes")!) { (data, _, _) in
        guard let data = data else {return}
        
        guard let gameOfThrones = try? JSONDecoder().decode(GameOfThrones.self, from: data) else {
            print("Something went wrong")
            return
        }
        DispatchQueue.main.async{
            self.episodeArray = gameOfThrones.embedded.episodes
            self.theTableView.reloadData()
        }
        }.resume()
    }
  }


struct GameOfThrones: Codable{
    let embedded: Embedded
    
    enum CodingKeys: String, CodingKey{
        case embedded = "_embedded"
    }
}

struct Embedded: Codable{
    let episodes: [Episode]
}

struct Episode: Codable{
    let name: String
    let season: Int
    let number: Int
    let airdate: String
    let airtime: String
    let summary: String
}


extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return episodeArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
    
    cell.textLabel?.text = "\(episodeArray[indexPath.row].season)" + "\(episodeArray[indexPath.row].number)" + episodeArray[indexPath.row].name
    return cell
  }
}

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let storyboard = UIStoryboard(name: "Main", bundle: nil)
    let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
    
    nextViewController.newEpisodeTitle = episodeArray[indexPath.row].name
    nextViewController.newEpisodeNumber = "\(episodeArray[indexPath.row].number)"
    nextViewController.newAirTime = episodeArray[indexPath.row].airtime
    nextViewController.newPremierDate = episodeArray[indexPath.row].airdate
    nextViewController.newSeason = "\(episodeArray[indexPath.row].season)"
    nextViewController.newSummary = episodeArray[indexPath.row].summary
    
    navigationController?.pushViewController(nextViewController, animated: true)
  }
}
