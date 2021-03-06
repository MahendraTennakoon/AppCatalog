//
//  App.swift
//  AppCatalog
//
//  Created by Kumarapperuma, Tharindu on 10/3/18.
//  Copyright © 2018 MADD. All rights reserved.
//

import UIKit

class Results: Codable {
    let results: [AppModel]
    
    init(results: [AppModel]) {
        self.results = results
    }
}

class AppModel: Codable {

    let trackName: String
    let sellerName: String
    let artworkUrl60: String
//    let appImage: UIImage?
    let wrapperType: String
    let primaryGenreName: String
    let formattedPrice: String?
    
    init(trackName: String, sellerName: String,artworkUrl60: String, wrapperType: String, primaryGenreName: String, formattedPrice: String){
        self.trackName = trackName
        self.sellerName = sellerName
        self.artworkUrl60 = artworkUrl60
        self.wrapperType = wrapperType
        self.primaryGenreName = primaryGenreName
        self.formattedPrice = formattedPrice
    }
    
    init () {
        self.trackName = ""
        self.sellerName = ""
        self.artworkUrl60 = ""
        self.wrapperType = ""
        self.primaryGenreName = ""
        self.formattedPrice = ""
    }

}
