//
//  ImageController .swift
//  BingImageSearch
//
//  Created by Nick Reichard on 4/2/17.
//  Copyright © 2017 Nick Reichard. All rights reserved.
//

import Foundation
import UIKit

class ImageController {
    
    static let baseUrlString = "https://api.cognitive.microsoft.com/bing/v5.0/images/search?"
    
    static func image(forURL url: String, completion: @escaping (UIImage?) -> Void) {
        
        guard let url = URL(string: "\(baseUrlString)\(url)") else {
            fatalError("Image URL optional is nil")
        }
        
        NetworkController.performRequest(for: url, httpMethod: .Get) { (data, error) in
            guard let data = data,
                let image = UIImage(data: data) else {
                    
                    DispatchQueue.main.async { completion(nil) }
                    return
            }
            DispatchQueue.main.async { completion(image) }
            
        }
    }
}
