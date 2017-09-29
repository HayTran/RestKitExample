//
//  Login.swift
//  RestKitExample
//
//  Created by Hay on 9/29/17.
//  Copyright © 2017 Akila Balasubramanian. All rights reserved.
//

import Foundation
class Result : NSObject {
    var result : String = ""
    var message : String = ""
    
    override init() {
        super.init()
    }
    
    init(result : String, message : String) {
        self.result = result
        self.message = message
    }
}
