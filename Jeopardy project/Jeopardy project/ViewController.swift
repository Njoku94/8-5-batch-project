//
//  ViewController.swift
//
//  Created by BrianNjoku on 8/22/19.
//  Copyright © 2019 MCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
@IBOutlet weak var jeopardyTableView: UITableView!
    

    var ClueArray: [Clue] = []
//    var ClueDataClass: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        jeopardyTableView.dataSource = self
        jeopardyTableView.register(UITableViewCell.self, forCellReuseIdentifier: "cluecell")
        guard let clueURL = URL(string: "http://jservice.io/api/clues") else { return }
        URLSession.shared.dataTask(with: clueURL) { (data,_ ,_) in
            guard let data = data,

                let newclue = try? JSONDecoder().decode([String].self, from: data) else { return }
            
            self.ClueArray = newclue
            do {
                ClueDataClass.shared.context.save()
            } catch {
                print(error.localizedDescription)
            }
            DispatchQueue.main.async {
                self.ClueArray = ClueDataClass.shared.getAllClues()
                self.jeopardyTableView.reloadData()
            }
            }.resume()
        
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ClueArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cluecell")
        cell.textLabel?.numberOfLines = 0
        cell.textLabel?.text = ClueArray[indexPath.row].answer + "/" + ClueArray[indexPath.row].question
        return cell
}
}

