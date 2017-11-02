//
//  Song.swift
//  iPlay
//
//  Created by mac_admin on 02/11/17.
//  Copyright © 2017 mac_admin. All rights reserved.
//

import Foundation
class Song {
    var name : String?
    var artist: String?
    var previewUrl : String?
    
        init(name: String?, artist: String?, previewUrl: String?) {
            self.name = name
            self.artist = artist
            self.previewUrl = previewUrl
        }
  
}
