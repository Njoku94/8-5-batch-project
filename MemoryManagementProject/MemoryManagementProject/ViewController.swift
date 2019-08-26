//
//  ViewController.swift
//  MemoryManagementProject
//
//  Created by Brian Njoku on 8/26/19.
//  Copyright © 2019 Brian Njoku. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let person = person(name: "Ryan")
        let dwelling = Abode(name: "NoSuchPlace")
        person.dwelling = dwelling
        dwelling.occupant = person
        print("end of view did load")
    }


class person {
    var name: String = ""
    var dwelling: Abode?
    
    
    denit {
     print("The person was murdered")
    }
}
init(namw: String) {
    self.name = name
  }


class Abode {
    var address: String
    var occupant: Person?
    
    init(name: String)
    self.name = name
}

class Abode = {
    var address: String {
    var occupant: Person?
}
}

    deinit {
      print("The abode has been bulldozed")
}

    init(address: String) 
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    self.address = address
}
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

