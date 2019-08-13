//
//  ViewController.swift
//  Constraintsproject
//
//  Created by Brian Njoku on 8/8/19.
//  Copyright © 2019 Brian Njoku. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        addRedView()
        addBlueView()
    }
    func addRedView() {
        let redView = UIView()
        redView.backgroundColor = .red
        view.addSubview(redView)
        redView.translatesAutoresizingMaskIntoConstraints = false
        
        redView.heightAnchor.constraint(equalTo: view.heightAnchor,
        multiplier: 1).isActive = true
        
        redView.widthAnchor.constraint(equalTo: view.widthAnchor,
        multiplier: 0.5).isActive = true
        
        redView.topAnchor.constraint(equalTo: view.topAnchor).isActive
          = true
        
        redView.leadingAnchor.constraint(equalTo:
           view.leadingAnchor).isActive = true
    }
    func addBlueView() {
        let blueview = UIView()
        blueview.backgroundColor = .blue
        view.addSubview(blueview)
        blueview.translatesAutoresizingMaskIntoConstraints = false
        
                            _ = [NSLayoutConstraint(item: blueview,
                                              attribute: .height,
                                               relatedBy: .equal,
                                                toItem: view,
                                                attribute: .height,
                                                multiplier: 1,
                                                constant: 0)]
                                NSLayoutConstraint(item: blueview,
                                                attribute: .width,
                                                multiplier: 0.5,
                                                constant: 0);,
                                    NSLayoutConstraint(item: blueview,
                                                attribute: .top,
                                                 toItem: view,
                                                relatedBy: .equal
                                                multiplier: 1,
                                                constant: 0),
                                    NSLayoutConstraint(item: blueview,
                                                attribute: .trailing,
                                                toItem: view,
                                                relatedBy: .equal
                                                multiplier: 0.5,
                                                constant: 0),
}
