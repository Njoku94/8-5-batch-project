//
//  ViewController.swift
//  Quiz 1
//
//  Created by Brian Njoku on 8/16/19.
//  Copyright © 2019 Brian Njoku. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //the json file url
    let URL_GameOfThrones = "https://api.tvmaze.com/shows/82?embed=seasons&embed=episodes";
    
    //A string array to save all the names
    var nameArray = [String]()
    
    //the table created
    @IBOutlet weak var TheTableView: UITableView!
    var array = ["hi", "hello", "goodbye"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TheTableView.dataSource = self
        TheTableView.delegate = self
        TheTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func updateString(with value: String) {
        guard let selectedRow = TheTableView.indexPathForSelectedRow?.row else { return }
        array[selectedRow] = value
        TheTableView.reloadData()
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        cell.textLabel?.text = array[indexPath.row]
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
    
}
}
