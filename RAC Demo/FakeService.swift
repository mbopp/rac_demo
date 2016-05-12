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
  
  class func fakeServiceCall(callback: (json: JSON) -> ()) {
    let dataArray = [1,2,3,4,5,6,7,8,9,10]
//    let resultArray = getDataImperatively(dataArray)
    let resultArray = getDataDeclaratively(dataArray)
    let json = JSON(resultArray)
    let time = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), 5 * Int64(NSEC_PER_SEC))
    dispatch_after(time, dispatch_get_main_queue()) {
      callback(json: json)
    }
  }
  
  class func getDataImperatively(inputArray: [Int]) -> [Int] {
    var resultArray: [Int] = []
    
    for i in inputArray {
      if i % 2 == 0 {
        resultArray.append(i)
      }
    }
    
    return resultArray
  }
  
  class func getDataDeclaratively(inputArray: [Int]) -> [Int] {
    return inputArray.filter { $0 % 2 == 0 }
  }
  
}
