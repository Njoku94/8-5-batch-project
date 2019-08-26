//
//  NextViewController.swift
//  ToDo
//
//  Created by Brian Njoku on 8/22/19.
//  Copyright © 2019 Brian Njoku. All rights reserved.
//

import Foundation
protocol NextViewControllerDelegate {
    func updateString(with value: String)
    func addNewString(with value: String)
    func updateArray(with value: [ToDoItem])
}

class NextViewController: UIViewController {
    
    let stuff = ToDoListStuff()
    
    @IBOutlet weak var theTextField: UITextField!
    var editItemText: String?
    var myArrayIndex: Int?
    var delegate: NextViewControllerDelegate?
    var toDoList: [ToDoItem] = []
    
    @IBAction func submit(_ sender: Any) {
        //let container = stuff.persistentContainer
        do {
            let newItem = try stuff.addToDoItem(name: theTextField.text ?? "")
            stuff.save()
        } catch {
            print("There was an error! Error: \(error.localizedDescription)")
        }
        if editItemText!.isEmpty{
            delegate?.addNewString(with: theTextField.text ?? "")
        } else {
            delegate?.updateString(with: theTextField.text ?? "")
            toDoList = stuff.getToDoList()
            stuff.removeItem(item: toDoList[myArrayIndex!])
            let newToDoList = stuff.getToDoList()
            delegate?.updateArray(with: newToDoList)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func completedItem(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            navigationController?.popViewController(animated: true)
        case 1:
            toDoList = stuff.getToDoList()
            if !editItemText!.isEmpty {
                stuff.removeItem(item: toDoList[myArrayIndex!])
                let newToDoList = stuff.getToDoList()
                delegate?.updateArray(with: newToDoList)
                navigationController?.popViewController(animated: true)
            }
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        theTextField.text = editItemText
        toDoList = stuff.getToDoList()
        
    }
    
}
