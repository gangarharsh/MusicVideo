//
//  ViewController.swift
//  MusicVideo
//
//  Created by Kalpesh on 2/22/16.
//  Copyright © 2016 Bigrattle Technologies. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let api = APIManager()
        api.loadData("https://itunes.apple.com/in/rss/topmusicvideos/limit=10/json", completion: didLoadData)
        
        
    }
    
    func didLoadData(result:String){
        print(result)
        
        let alert = UIAlertController(title: result, message: nil, preferredStyle: .Alert)
        
        let okAction = UIAlertAction (title: "Ok", style: .Default) { (action) -> Void in
            //do something
        }
        
        alert.addAction(okAction)
        
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

}