//
//  BadViewController.swift
//  RAC Demo
//
//  Created by Michael Bopp on 5/2/16.
//  Copyright © 2016 Michael Bopp. All rights reserved.
//

import UIKit

class BadViewController: UIViewController, UITextFieldDelegate {

  @IBOutlet weak var oneTextfield: UITextField!
  @IBOutlet weak var twoTextfield: UITextField!
  @IBOutlet weak var threeTextfield: UITextField!
  @IBOutlet weak var resultLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    threeTextfield.addTarget(self, action: #selector(BadViewController.calculateSum), forControlEvents: UIControlEvents.EditingChanged)
  }
  
  func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
    calculateSum()
    return true
  }
  
  @IBAction func oneTextfieldDidChange(sender: AnyObject) {
    calculateSum()
  }

 
  func calculateSum() {
   
    let a: Int = Int(oneTextfield.text!) ?? 0
    let b: Int = Int(twoTextfield.text!) ?? 0
    let c: Int = Int(threeTextfield.text!) ?? 0
    
    let total = a + b + c
    
    resultLabel.text = "Total: \(total)"
  }
}
