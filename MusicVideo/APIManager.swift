//
//  APIManager.swift
//  MusicVideo
//
//  Created by Kalpesh on 3/2/16.
//  Copyright © 2016 Bigrattle Technologies. All rights reserved.
//

import Foundation

class APIManager{
    func loadData(urlString:String, completion: (result:String) -> Void){
        
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        
        let session = NSURLSession(configuration: config)
        
//        let session  = NSURLSession.sharedSession()WS
        let url = NSURL(string: urlString)!
        
        let task = session.dataTaskWithURL(url){
            (data,response, error) -> Void in
            dispatch_async(dispatch_get_main_queue()){
                if error != nil {
                    completion(result: (error?.localizedDescription)!)
                }
                else{
                    completion(result: "NSURLSession Successuful")
                    print(data)
                }
            }
        }
        task.resume()
    }
}