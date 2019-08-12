//
//  NextViewController.swift
//  Project1
//
//  Created by Brian Njoku on 8/11/19.
//  Copyright © 2019 Brian Njoku. All rights reserved.
//

import Foundation
import UIKit

protocol EditViewControllerDelegate {
    
}
protocol NextViewControllerDelegate {
    func updateString(with value: String)
}
class NextViewController: UIViewController {
    
@IBOutlet weak var Slider: UISlider!
@IBOutlet weak var Switch: UISwitch!
@IBOutlet weak var Stepper: UIStepper!
@IBOutlet weak var SegmentedControl: UISegmentedControl!
@IBOutlet weak var TextField: UITextField!
    var editString: String?
    var delegate: NextViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TextField.text = editString
    }
    

    
    @IBAction func submit(_ sender: Any) {
delegate?.updateString(with: TextField.text ?? "")
    navigationController?.popViewController(animated: true)
}
}


