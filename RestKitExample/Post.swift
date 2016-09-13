//
//  Post.swift
//  RestKitExample
//
//  Created by Akila Balasubramanian on 9/13/16.
//  Copyright © 2016 Akila Balasubramanian. All rights reserved.
//

import Foundation

class Post: NSObject {
    
    var userId = 0
    var id = 0
    var title = ""
    var body = ""
    
    override init() {
        super.init()
    }
    
    init(userId: Int, id: Int, title: String, body: String) {
        
        self.userId = userId
        self.id = id
        self.title = title
        self.body = body
        
    }
    
}