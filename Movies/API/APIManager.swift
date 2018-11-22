

//
//  APIManager.swift
//  Movies
//
//  Created by Ibrahim El-geddawy on 6/26/18.
//  Copyright © 2018 Jiddawi. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class APIManager: NSObject {
    
    class func loadMovies( completion : @escaping (_ error : Error?, _ movies : [Movie]?) -> Void){
        
        let url = URLs.main
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            switch response.result{
            case .failure(let error):
                print(error.localizedDescription)
                completion(error, nil)
            case .success(let value):
                let json = JSON(value)
                //                print(json)
                guard let dataArr = json.array else {
                    completion(nil, nil)
                    return
                }
                var movies = [Movie]()
                for data in dataArr {
                    if let data = data.dictionary, let movie = Movie.init(dic: data){
                        movies.append(movie)
                        
                    }
                //                    print(movies)
                    
                }
                completion(nil, movies)
            }
        }
    }
}

