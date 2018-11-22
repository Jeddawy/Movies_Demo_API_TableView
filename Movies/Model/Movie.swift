//
//  Movie.swift
//  Movies
//
//  Created by Ibrahim El-geddawy on 6/26/18.
//  Copyright © 2018 Jiddawi. All rights reserved.
//

import Foundation
import SwiftyJSON

class Movie: NSObject {
    var title : String?
    var image : String?
    var rating : Int?
    
    init?(dic : [String : JSON]){
        guard let title = dic["title"]?.string, let image = dic["image"]?.string, let rating = dic["rating"]?.toInt else {return nil}
        self.title = title
        self.image = image
        self.rating = rating
        
    }
}
