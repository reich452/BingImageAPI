//
//  ImageController.swift
//  BingImageSearch
//
//  Created by Nick Reichard on 4/2/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import Foundation

class ImageSearchController {
    
    static let baseURL = URL(string: "https://api.cognitive.microsoft.com/bing/v5.0/images/search?")
    static let apiKey = "0231de06566d4717873444afb447e586"
    
    static func fetchImage(for imageSearch: String, completion: @escaping ([Image]) -> Void) {
        guard let baseUrl = baseURL else { completion([]); return }
        let urlParameters = ["q": imageSearch, "Ocp-Apim-Subscription-Key" : apiKey]
        
        NetworkController.performRequest(for: baseUrl, httpMethod: .Get, urlParameters: urlParameters, body: nil) { (data, error) in
            
            if let error = error {
                print(error.localizedDescription)
                completion([])
                return
            }
            guard let data = data,
                let jsonDictionaries = (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)) as? [String:Any] else { completion([]); return }
            
            guard let imageArray = jsonDictionaries["value"] as? [[String: Any]] else {
                completion([]); return }
            
            let images = imageArray.flatMap( {Image(jsonDictionary: $0)})
            
            for image in images {
                ImageController.image(forURL: image.imageUrlString, completion: { (newImage) in
                    
                })
            }
            
            completion(images)
            
        }
    }
}

