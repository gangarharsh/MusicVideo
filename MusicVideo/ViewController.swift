//
//  ViewController.swift
//  MusicVideo
//
//  Created by Kalpesh on 2/22/16.
//  Copyright © 2016 Bigrattle Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let api = APIManager()
        api.loadData("https://itunes.apple.com/in/rss/topmusicvideos/limit=20/json", completion: didLoadData)
        
        
    }
    
    func didLoadData(video: [Video]){
        
        self.videos = video
        for (index,item) in videos.enumerate(){
            print(" [\(index+1)] name = \(item.vName)")
        }
        
    }

}