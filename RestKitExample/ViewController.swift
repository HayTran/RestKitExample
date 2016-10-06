//
//  ViewController.swift
//  RestKitExample
//
//  Created by Akila Balasubramanian on 9/13/16.
//  Copyright © 2016 Akila Balasubramanian. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var userIdLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Define mappings
        
        let postMapping: RKObjectMapping = RKObjectMapping(forClass: Post.self)
        postMapping.addAttributeMappingsFromArray(["userId", "id", "title", "body"])
        
        // Define response decriptor
        
        let statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClass.Successful);
        let resDescriptor = RKResponseDescriptor(mapping: postMapping, method: RKRequestMethod.GET, pathPattern: "/posts/:id", keyPath: nil, statusCodes: statusCodes)
        
        // Create object manager
        
        let url = NSURL(string: "https://jsonplaceholder.typicode.com")
        let jsonPlaceholderManager = RKObjectManager(baseURL: url)
        jsonPlaceholderManager.addResponseDescriptor(resDescriptor)
        RKObjectManager.setSharedManager(jsonPlaceholderManager)
        
        // Perform GET request
        
        RKObjectManager.sharedManager().getObjectsAtPath("/posts/1", parameters: nil, success: { (operation, mappingResult) -> Void in
            
            let post: Post = mappingResult.firstObject as! Post;
            
            self.idLabel.text = "\(post.id)"
            self.userIdLabel.text = "\(post.userId)"
            self.titleLabel.text = "\(post.title)"
            self.bodyLabel.text = "\(post.body)"
            
            
        }) { (operation, error) -> Void in
            print(error.localizedDescription)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

