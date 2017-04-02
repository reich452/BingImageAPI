//
//  Image.swift
//  BingImageSearch
//
//  Created by Nick Reichard on 4/2/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import Foundation
import UIKit

class Image {
    
    private let imageNameKey = "name"
    private let imageUrlKey = "contentUrl"
    
    let imageName: String
    var imagePath: UIImage?
    let imageUrlString: String
    
    var image: UIImage?
    
    var imageUrl: URL? {
        return URL(string: imageUrlString)
    }
    
    init?(jsonDictionary: [String:Any]) {
        
        guard let imageName = jsonDictionary[imageNameKey] as? String,
            let imageUrl = jsonDictionary[imageUrlKey] as? String
            else { return nil }
        
        self.imageName = imageName
        self.imageUrlString = imageUrl
        
    }
    
}
