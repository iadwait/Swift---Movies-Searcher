//
//  UIImageView + Extension.swift
//  Movies Searcher
//
//  Created by Adwait Barkale on 07/09/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView
{
    func fetchImage(fromURL: String)
    {
        guard let imgURL = URL(string: fromURL) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: imgURL) { (data, response, err) in
            if let imgData = data,err == nil {
                DispatchQueue.main.async {
                    let image = UIImage(data: imgData)
                    self.image = image
                }
                
            }
        }
        task.resume()
    }
}
