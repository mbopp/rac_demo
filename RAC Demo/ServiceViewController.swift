//
//  ServiceViewController.swift
//  RAC Demo
//
//  Created by Michael Bopp on 5/4/16.
//  Copyright © 2016 Michael Bopp. All rights reserved.
//

import UIKit
import ReactiveCocoa
import SwiftyJSON

class ServiceViewController: UIViewController {

  @IBOutlet weak var startButton: UIButton!
  @IBOutlet weak var resultLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    startButton.addTarget(self, action: #selector(ServiceViewController.startSync(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    
  }
  
  func startSync(sender: AnyObject) -> Void {
    
    retrieveJSON()
      .on(failed: { [weak self] error in
        self!.resultLabel.text = "Error: \(error.localizedDescription)"
      })
      .startWithNext { [weak self] json in
        print(json)
        self!.resultLabel.text = json.array?.map { $0.stringValue }.joinWithSeparator("-")
      }
    
  }
  
  func retrieveJSON() -> SignalProducer<JSON,NSError> {
    return SignalProducer { observer, disposable in
      FakeService.fakeServiceCall({ (json) in
        if (json == nil) {
          observer.sendFailed(NSError(domain: "RAC Demo", code: 1, userInfo: ["localizedDescription": "No JSON was returned."]))
        }
        observer.sendNext(json)
        observer.sendCompleted()
      })
    }
  }
  
}
