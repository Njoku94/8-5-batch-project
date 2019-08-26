//
//  FirstViewController.swift
//  ToDo
//
//  Created by Brian Njoku on 8/20/19.
//  Copyright © 2019 Brian Njoku. All rights reserved.
//

import UIKit

class ViewController: UIViewController, NextViewControllerDelegate {
    
    let stuff = ToDoListStuff()
    var array: [String] = []
    
    @IBOutlet weak var toDoListTable: UITableView!
    
    @IBAction func addItemToList(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let nextViewController = storyboard.instantiateViewController(withIdentifier: "NextViewController") as! NextViewController
        nextViewController.editItemText = ""
        nextViewController.delegate = self
        navigationController?.pushViewController(nextViewController, animated: true)
    }
    
    func updateString(with value: String){
        guard let selectedRow = toDoListTable.indexPathForSelectedRow?.row else{ return }
        array[selectedRow] = value
        toDoListTable.reloadData()
    }
    
    func addNewString(with value: String){
        array.append(value)
        toDoListTable.reloadData()
    }
    
    func updateArray(with value: [ToDoItem]){
        array = []
        let arrayOfToDoList = value
        for items in arrayOfToDoList {
            guard let name = items.name else {return }
            array.append(name)
        }
        toDoListTable.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        toDoListTable.dataSource = self
        toDoListTable.delegate = self
        toDoListTable.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        let arrayOfToDoList = stuff.getToDoList()
        for items in arrayOfToDoList {
            guard let name = items.name else {return }
            array.append(name)
        }
        // Do any additional setup after loading the view.
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
        nextViewController.editItemText = array[indexPath.row]
        nextViewController.myArrayIndex = indexPath.row
        nextViewController.delegate = self
        navigationController?.pushViewController(nextViewController, animated: true)
}
