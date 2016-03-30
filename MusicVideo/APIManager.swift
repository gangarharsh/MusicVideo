//
//  APIManager.swift
//  MusicVideo
//
//  Created by Kalpesh on 3/2/16.
//  Copyright © 2016 Bigrattle Technologies. All rights reserved.

import Foundation

class APIManager{
    func loadData(urlString:String, completion: [Video] -> Void){
        
        let config = NSURLSessionConfiguration.ephemeralSessionConfiguration()
        let session = NSURLSession(configuration: config)
//        let session  = NSURLSession.sharedSession()
        let url = NSURL(string: urlString)!
        let task = session.dataTaskWithURL(url){
            (data, response, error) -> Void in
            if error != nil{
                
                    print(error!.localizedDescription)
                
            }
            else{
                do{
                    if let json = try NSJSONSerialization.JSONObjectWithData(data!, options: .AllowFragments) as? JSONDictionary,
                    feeds = json["feed"] as? JSONDictionary,
                    entries = feeds["entry"] as? JSONArray{
                    var videos = [Video]()
                        for entry in entries{
                            let entry = Video(data: entry as! JSONDictionary)
                            videos.append(entry)
                        }
                        let i = videos.count
                    print("Videos count in API-Manger = \(i)")
                        
                    let priority = DISPATCH_QUEUE_PRIORITY_HIGH
                        dispatch_async(dispatch_get_global_queue(priority, 0)){
                    dispatch_async(dispatch_get_main_queue()){
                        completion(videos)
                    }
                }
                }
                }
                catch{
                    
                       print("error in NSJSONserialization")
                    
                }
            }
        }
        task.resume()
     }
}