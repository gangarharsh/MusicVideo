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
    
    private var _vRights:String
    private var _vPrice:String
    private var _vArtist:String
    private var _vImid:String
    private var _vGenre:String
    private var _vLinkToiTunes:String
    private var _vReleaseDate:String
    
    var vName: String{
        return _vName
    }
    
    var vImageURL:String{
        return _vImageURL
    }
    
    var vVideoUrl:String{
        return _vVideoURL
    }
    
    var vRights:String{
        return _vRights
    }
    
    var vPrice:String{
        return _vPrice
    }
    
    var vArtist:String{
        return _vArtist
    }
    
    var vImid:String{
        return _vImid
    }
    
    var vLinkToiTunes:String{
        return _vLinkToiTunes
    }
    
    var vReleaseDate:String{
        return _vReleaseDate
    }

    //created from the UI
    var imageData:NSData?
    
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
        
        if let rights = data["rights"] as? JSONDictionary,
        vRights = rights["label"] as? String {
            _vRights = vRights
        }
        else{
            _vRights = ""
        }
        
        if let price = data["im:price"] as? JSONDictionary,
        priceLabel = price["label"] as? String {
            _vPrice = priceLabel
        }
        else{
            _vPrice = ""
        }
        
        if let artist = data["im:artist"] as? JSONDictionary,
            artistName = artist["label"] as? String{
                _vArtist = artistName
        }
        else{
            _vArtist = ""
        }
        
        if let id = data["id"] as? JSONDictionary,
        idAttr = id["attributes"] as? JSONDictionary,
            imID = idAttr["im:id"] as? String{
                _vImid = imID
        }
        else{
            _vImid = ""
        }
        
        if let genreCategory = data["category"] as? JSONDictionary,
        genreAttr = genreCategory["atteibutes"] as? JSONDictionary,
            genre = genreAttr["term"] as? String{
                _vGenre = genre
        }
        else{
            _vGenre = ""
        }
        
        if let link = data["id"] as? JSONDictionary,
            viTunesLink = link["label"] as? String{
                _vLinkToiTunes = viTunesLink
        }
        else{
            _vLinkToiTunes = ""
        }
        
        if let release = data["im:releaseDate"] as? JSONDictionary,
        releaseAttr = release["attributes"] as? JSONDictionary,
            releaseLabel = releaseAttr["label"] as? String{
                _vReleaseDate = releaseLabel
        }
        else{
            _vReleaseDate = ""

        }
    }
}