//
//  ViewController.swift
//  Project1
//
//  Created by Brian Njoku on 8/9/19.
//  Copyright © 2019 Brian Njoku. All rights reserved.
//

import UIKit

class ViewController: UIViewController,NextViewControllerDelegate {
    
@IBOutlet weak var TableView: UITableView!
    var array = ["Slider","textfield","Stepper","SegmentedControl", "Switch",]
    override func viewDidLoad() {
        super.viewDidLoad()
        TableView.dataSource = self
        TableView.delegate = self
        TableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func updateString(with value: String) {
        guard let selectedRow = TableView.indexPathForSelectedRow?.row else { return }
        array[selectedRow] = value
        TableView.reloadData()
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
        let NextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
        let tappedString = array[indexPath.row]
        NextViewController.editString = tappedString
        NextViewController.delegate = self
        present(NextViewController, animated: true,completion: nil)
        
navigationController?.popViewController(animated: true)
        
    }
}
 
