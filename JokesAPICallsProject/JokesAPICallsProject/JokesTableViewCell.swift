//
//  JokesTableViewCell.swift
//  JokesAPICallsProject
//
//  Created by BrianNjoku on 8/26/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class JokesTableViewCell: UITableViewCell {

    @IBOutlet weak var jokeCell: UILabel!
    
    var favorite = false
    var favoriteArray: [Joke] = []
    var cellJoke: String?
    var cellSetup: String?
    var cellDelivery: String?
    var cellCategory: String?
    var cellType: String?
    var cellJokeSearch: Joke?
    
    var favoriteUpdate: Joke?
    
    @IBOutlet weak var favoriteButtonOutlet: UIButton!
    
    @IBAction func favoriteButton(_ sender: Any) {
        do {
            if !favorite {
                let newJoke = try JokeDataManager.shared.addJoke(joke: cellJoke ?? "",
                                                                 setup: cellSetup ?? "",
                                                                 delivery: cellDelivery ?? "",
                                                                 category: cellCategory ?? "",
                                                                 type: cellType ?? "")
                JokeDataManager.shared.save()
                cellJokeSearch = newJoke
            } else {
    
                JokeDataManager.shared.removeJoke(joke: cellJokeSearch!)
                JokeDataManager.shared.save()
            }
        } catch {
            print("There was an error! Error: \(error.localizedDescription)")
        }
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //favoriteArray = JokeDataManager.shared.getAllJokes()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}



