//
//  MusicVideo.swift
//  MusicVideo
//
//  Created by Kalpesh on 3/28/16.
//  Copyright © 2016 Bigrattle Technologies. All rights reserved.
//

import Foundation

class Video {
    
    private var _vName:String
    private var _vImageURL:String
    private var _vVideoURL:String
    
    
    var vName: String{
        return _vName
    }
    
    var vImageURL:String{
        return _vImageURL
    }
    
    var vVideoUrl:String{
        return _vVideoURL
    }
    
    
    init(data: JSONDictionary)
    {
        if let name = data["im:name"] as? JSONDictionary, vName = name["label"] as? String {
            _vName = vName
        }
        else
        {
            _vName = ""
        }
        
       if let img = data["im:image"] as? JSONArray,
        image = img[2] as? JSONDictionary,
        immage = image["label"] as? String{
            _vImageURL = immage.stringByReplacingOccurrencesOfString("100x100", withString: "600x600")
        }
        else
       {
            _vImageURL = ""
        }
        
      if let vid = data["link"] as? JSONArray,
        video = vid[1] as? JSONDictionary,
        vidAttr = video["attributes"] as? JSONDictionary,
        vidHref = vidAttr["href"] as? String{
            _vVideoURL = vidHref
        }
        else{
        _vVideoURL = ""
        }
        
    }
    
    
}