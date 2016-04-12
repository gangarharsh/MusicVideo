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
    
    @IBOutlet weak var displayLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        print(reachabilityStatus)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "reachabilityStatusChanged", name: "ReachStatusChanged", object: nil)
        reachabilityStatusChanged()
        let api = APIManager()
        api.loadData("https://itunes.apple.com/in/rss/topmusicvideos/limit=20/json", completion: didLoadData)
        
        
    }
    
    func didLoadData(video: [Video]){
        
        self.videos = video
        for (index,item) in videos.enumerate(){
            print(" [\(index+1)] name = \(item.vName)")
        }
        
    }
    
    func reachabilityStatusChanged(){
        switch(reachabilityStatus){
        case WIFI: displayLabel.text = "Reachable on WIFI"
        view.backgroundColor = UIColor.greenColor()
        case NOACCESS: displayLabel.text = "No Access"
        view.backgroundColor = UIColor.redColor()
        case WWAN: displayLabel.text = "Reachable on WWAN"
        view.backgroundColor = UIColor.yellowColor()
        default:return
        }
    }
    
    deinit{
        NSNotificationCenter.defaultCenter().removeObserver(self, name: "ReachStatusChanged", object: nil)
    }

}