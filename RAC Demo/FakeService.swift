//
//  FakeService.swift
//  RAC Demo
//
//  Created by Michael Bopp on 5/4/16.
//  Copyright © 2016 Michael Bopp. All rights reserved.
//

import Foundation
import SwiftyJSON

class FakeService: NSObject {

  
  func fakeServiceCall(callback: (json: JSON) -> ()) {
    let json = JSON(["test":"test"])
    let time = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), 5 * Int64(NSEC_PER_SEC))
    dispatch_after(time, dispatch_get_main_queue()) {
      callback(json: json)
    }
  }
  
}
