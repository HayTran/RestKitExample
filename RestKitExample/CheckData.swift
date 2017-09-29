//
//  CheckData.swift
//  RestKitExample
//
//  Created by Hay on 9/29/17.
//  Copyright © 2017 Akila Balasubramanian. All rights reserved.
//

import Foundation
class CheckData : NSObject {
    var device_id : String = ""
    var customer_id : String = ""
    
    override init() {
        super.init()
    }
    
    init(customer_id : String, device_id : String ) {
        self.device_id = device_id
        self.customer_id = customer_id
    }
}
