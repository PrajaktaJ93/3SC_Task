//
//  AppUtility.swift
//  3SC_Task
//
//  Created by Prajakta on 06/04/23.
//

import Foundation
import UIKit

/// App utility function
class AppUtility {
    
    static let shared: AppUtility = AppUtility()
  
    func loadImage(imageUrlString: String? = "") -> UIImage {
        let imageUrl = URL(string: imageUrlString!)!
        let imageData: NSData = NSData(contentsOf: imageUrl)!
        let image = UIImage(data: imageData as Data)
        return image!
    }
}
