//
//  FirstViewController.swift
//  ToDo
//
//  Created by Brian Njoku on 8/20/19.
//  Copyright © 2019 Brian Njoku. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {


    
    
    let list = ["Eat Breakfast","Run 5 miles","Get Peter","Walk my dog"]
    
    @IBOutlet weak var myTableView: UITableView!
    
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    myTableView.delegate = self
        myTableView.dataSource = self
       // if editingStyle == UITableViewCellEditingStyle.delete
        //{
        //self.list.remove(at: indexPath.row)
        //myTableView.reloadData()
       // }
    }
        
        

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
    cell.textLabel?.text = list[indexPath.row]
    return(cell)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    

}

