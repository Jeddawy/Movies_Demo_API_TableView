//
//  JSON+Casting.swift
//  Movies
//
//  Created by Ibrahim El-geddawy on 6/26/18.
//  Copyright © 2018 Jiddawi. All rights reserved.
//

import Foundation
import SwiftyJSON

extension JSON {
    var toInt : Int? {
        
        if let int = self.int {return int}
        if let string = self.string, let int = Int(string) {
            return int
        }
        return nil
    }
}
