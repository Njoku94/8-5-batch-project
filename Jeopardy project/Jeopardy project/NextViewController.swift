//
//  NextViewController.swift
//  Jeopardy project
//
//  Created by Brian Njoku on 8/21/19.
//  Copyright © 2019 Brian Njoku. All rights reserved.
//
import UIKit

class NextViewController: UIViewController{
    
@IBOutlet weak var clueLabel: UILabel!
@IBOutlet weak var answerLabel: UILabel!
@IBOutlet weak var categoryLabel: UILabel!
@IBOutlet weak var airdateLabel: UILabel!
@IBOutlet weak var creationdateLabel:UILabel!
@IBOutlet weak var ValueLabel: UILabel!
    
    var updateClue: String?
    var updateAnswer: String?
    var updateCategory: String?
    var updateValue: String?
    var updateAirdate: String?
    var updateCreationdate: String?
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let dateFormatterGet = DateFormatter()
        dateFormatterGet.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
        
        let dateFormatterPrint = DateFormatter()
        dateFormatterPrint.dateFormat = "MM-dd-yyyy"
        
        guard let airDateEnable = dateFormatterGet.date(from: updateAirdate ?? "") else {return}
        let newAirDate = dateFormatterPrint.string(from: airDateEnable)
        
        guard let creationDateEnable = dateFormatterGet.date(from: updateCreationdate ?? "") else {return}
        let newCreationDate = dateFormatterPrint.string(from: creationDateEnable)
        
        clueLabel.text = updateClue
        answerLabel.text = updateAnswer
        categoryLabel.text = updateCategory
        clueLabel.text = updateValue
        airdateLabel.text = newAirDate
        creationdateLabel.text = newCreationDate
        
        
    }
    
}
