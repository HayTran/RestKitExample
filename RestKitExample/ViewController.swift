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
        
        // Define respone mappings
        let postMapping: RKObjectMapping = RKObjectMapping(for: Result.self)
        postMapping.addAttributeMappings(from: ["result", "message"])
        
        // Define response decriptor
        let statusCodes = RKStatusCodeIndexSetForClass(RKStatusCodeClass.successful)
        let resDescriptor = RKResponseDescriptor(mapping: postMapping, method: RKRequestMethod.POST, pathPattern: "index.php/apis/customer/info/is_valid", keyPath: nil, statusCodes: statusCodes)
       
        // Make request data
        let checkData =  CheckData()
        checkData.customer_id = "9"
        checkData.device_id = "89"
        
        // Define request mapping
        let requestMapping  : RKObjectMapping = RKObjectMapping.request()
        requestMapping.addAttributeMappings(from: ["customer_id", "device_id"])
        let reqDescriptor = RKRequestDescriptor(mapping: requestMapping, objectClass: CheckData.self, rootKeyPath: nil, method: RKRequestMethod.POST)
        
        // Create object manager
        let url = URL(string: "https://trendcloud.net/")
        let jsonPlaceholderManager = RKObjectManager(baseURL: url!)
        jsonPlaceholderManager?.addResponseDescriptor(resDescriptor)
        jsonPlaceholderManager?.addRequestDescriptor(reqDescriptor)
        jsonPlaceholderManager?.requestSerializationMIMEType = RKMIMETypeJSON
        
         // Enable response in text/html format
        jsonPlaceholderManager?.setAcceptHeaderWithMIMEType("text/html")
        RKMIMETypeSerialization.registerClass(RKNSJSONSerialization.self, forMIMEType: "text/html")
        
        // Perform POST request
        jsonPlaceholderManager?.post(checkData, path: "index.php/apis/customer/info/is_valid", parameters: nil, success: { (operation, mappingResult ) in
            print("success")
            
        }) { (operation, error) in
                    print(error?.localizedDescription)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

