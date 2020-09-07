//
//  MoviesDataModel.swift
//  Movies Searcher
//
//  Created by Adwait Barkale on 07/09/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import Foundation


struct MovieResult: Codable{
    
    let Search: [Movie]
}

struct Movie: Codable {
    
    let Title: String
    let Year: String
    let imdbID: String
    let _Type: String
    let Poster: String
    
    enum CodingKeys: String,CodingKey {
        case Title,Year,imdbID,_Type = "Type",Poster
    }
}
