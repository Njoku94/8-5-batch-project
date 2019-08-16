//
//  NextViewController.swift
//  TableViewProject
//
//  Created by MAC on 8/8/19.
//  Copyright © 2019 PaulRenfrew. All rights reserved.
//

import UIKit

protocol NextViewControllerDelegate {
  func updateString(with value: String)
}

class NextViewController: UIViewController {
  
    @IBOutlet weak var episodeNumberLabel: UILabel!
    
    @IBOutlet weak var episodeNameLabel: UILabel!
    
    @IBOutlet weak var airTimeLabel: UILabel!
    
    @IBOutlet weak var premierDateLabel: UILabel!
    
    @IBOutlet weak var seasonLabel: UILabel!
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    var newEpisodeNumber: String?
    var newEpisodeTitle: String?
    var newPremierDate: String?
    var newAirTime: String?
    var newSeason: String?
    var newSummary: String?
    
    override func viewDidLoad() {
    super.viewDidLoad()
        episodeNameLabel.text = newEpisodeTitle
        episodeNumberLabel.text = newEpisodeNumber
        airTimeLabel.text = newAirTime
        premierDateLabel.text = newPremierDate
        seasonLabel.text = newSeason
        summaryLabel.text = newSummary
  }
  
}
