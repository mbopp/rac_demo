//
//  ViewController.swift
//  RAC Demo
//
//  Created by Michael Bopp on 5/1/16.
//  Copyright © 2016 Michael Bopp. All rights reserved.
//

import UIKit
import ReactiveCocoa

class ViewController: UIViewController {

  @IBOutlet weak var oneTextfield: UITextField!
  @IBOutlet weak var twoTextfield: UITextField!
  @IBOutlet weak var threeTextfield: UITextField!
  @IBOutlet weak var resultLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    combineLatest(oneTextfield.rac_text.producer, twoTextfield.rac_text.producer, threeTextfield.rac_text.producer)
      .startWithNext { one, two, three in
        print("\(one) - \(two) - \(three)")
      }
    
  }

}
