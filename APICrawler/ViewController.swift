//
//  ViewController.swift
//  APICrawler
//
//  Created by Brian Njoku on 8/19/19.
//  Copyright © 2019 Brian Njoku. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var crawlerTableView: UITableView!
    var url: String? = "https://pokeapi.co/api/v2"
    var jsonDictionary: [String: Any] = [:]{
        didSet{
            dictionaryChanged = true
        }
    }
    var array: [[String: Any]] = [] {
        didSet{
            dictionaryChanged = false
        }
    }
    
    var dictionaryChanged = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        crawlerTableView.dataSource = self
        crawlerTableView.delegate = self
        crawlerTableView.register(UITableViewCell.self, forCellReuseIdentifier: "crawlerCell")
        guard let unwrappedURL = url,
            let url = URL(string: unwrappedURL) else {return}
        URLSession.shared.dataTask(with: url){ (data,_,_) in
            guard let data = data,
                let jsonObject = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] else { return }
            self.jsonDictionary = jsonObject
            DispatchQueue.main.async{
                self.crawlerTableView.reloadData()
            }
            }.resume()
        // Do any additional setup after loading the view.
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return !dictionaryChanged ? array.count : jsonDictionary.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "crawlerCell")
        if !dictionaryChanged{
            cell.textLabel?.text = "Index[\(indexPath.row)]"
        } else{
            let orderedKeys = jsonDictionary.keys.sorted()
            let currentKey = orderedKeys[indexPath.row]
            let currentValue = jsonDictionary[currentKey]
            cell.textLabel?.text = currentKey
            if let currentValueArray = currentValue as? [[String: Any]]{
                cell.detailTextLabel?.text = "Array with \(currentValueArray.count) elements"
            }else {
                cell.detailTextLabel?.text = "\(currentValue ?? "No Value")"
            }
        }
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !dictionaryChanged{
            let tappedElement = array[indexPath.row]
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let nextViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
            nextViewController.jsonDictionary = tappedElement
            nextViewController.url = nil
            navigationController?.pushViewController(nextViewController, animated: true)
        } else {
            let tappedKey = jsonDictionary.keys.sorted()[indexPath.row]
            if let tappedURL = jsonDictionary[tappedKey] as? String {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let nextViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                if tappedURL.hasPrefix("http"){
                    nextViewController.url = tappedURL
                    navigationController?.pushViewController(nextViewController, animated: true)
                }
            } else if let tappedArray = jsonDictionary[tappedKey] as? [[String:Any]]{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let nextViewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                nextViewController.array = tappedArray
                nextViewController.url = nil
                navigationController?.pushViewController(nextViewController, animated: true)
            }
        }
    }
}
