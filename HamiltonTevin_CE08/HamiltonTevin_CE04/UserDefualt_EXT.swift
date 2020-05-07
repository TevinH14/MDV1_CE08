//
//  UserDefualt_EXT.swift
//  UserDefaultsLecture
//
//  Created by Tevin Hamilton on 9/23/19.
//  Copyright © 2019 Patti Dacosta. All rights reserved.
//

import Foundation
import UIKit

extension UserDefaults
{
    //save a uicolor as a data object
    func set(color: UIColor, forKey key: String)
    {
        let binaryData = try? NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: true)
        self.set(binaryData,forKey: key)
    }
    
    func color(forKey key: String) -> UIColor? {
        // first check for valid data
        if let binaryData = data(forKey: key)
        {
            if let color = try? NSKeyedUnarchiver.unarchivedObject(ofClass: UIColor.self, from: binaryData){
                return color
            }
            
        }
        return nil
    }
    
}

