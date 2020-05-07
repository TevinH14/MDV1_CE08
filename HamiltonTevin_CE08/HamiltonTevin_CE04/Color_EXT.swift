//Color_EXT.swift
//UserDefaultsLecture
//
//Copyright © 2019 Patti Dacosta. All rights reserved.

import Foundation
import UIKit

extension UIColor {
    
    //Returning via Tuple of Floats lets us name the values for extremely easy access back in our ViewController
    func RGBA() -> (red: Float, green: Float, blue: Float, alpha: Float) {
        
        //Get the array of CGFloat components (RGBA values)
        if let colorValues = self.cgColor.components {
            //Cast values to Floats and return if Optional Binding worked
            return (Float(colorValues[0]), Float(colorValues[1]), Float(colorValues[2]), Float(colorValues[3]) )
        }
        
        //If the conversion fails, return Black
        print("Color conversion to components failed in Color_EXT.swift - returning black color")
        return (0,0,0,1)
    }
    
    
}
