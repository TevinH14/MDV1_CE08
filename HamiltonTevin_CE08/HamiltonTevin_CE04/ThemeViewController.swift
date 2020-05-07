//
//  ThemeViewController.swift
//  HamiltonTevin_CE04
//
//  Created by Tevin Hamilton on 9/25/19.
//  Copyright © 2019 Tevin Hamilton. All rights reserved.
//

import UIKit

class ThemeViewController: UIViewController {
    
    @IBOutlet weak var viewColor: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    var btnCheck = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func ColorChange(_ sender: UIButton)
    {
        
        switch sender.tag {
        case 0:
            btnCheck = 0
            redSlider.value = 0
            greenSlider.value = 0
            blueSlider.value = 0
            redLabel.text = "Red"
            greenLabel.text = "Green"
            blueLabel.text = "Blue"
        case 1:
            btnCheck = 0
            redSlider.value = 0
            greenSlider.value = 0
            blueSlider.value = 0
            btnCheck = 1
            redLabel.text = "Red"
           greenLabel.text = "Green"
            blueLabel.text = "Blue"
            
        case 2:
            btnCheck = 2
            redLabel.text = "Red"
            greenLabel.text = "Green"
            blueLabel.text = "Blue"
        default:
            print("something went wrong")
        }
    }
    
    
    
    
    @IBAction func sliderDidChange(_ sender: UISlider)
    {
        switch sender.tag {
        case 0:
            //update red label
            redLabel.text = redSlider.value.description
        case 1:
            greenLabel.text = greenSlider.value.description
        case 2:
            blueLabel.text = blueSlider.value.description
        default:
            print("something went wrong")
        }
        
        switch btnCheck {
        case 0:
            titleLabel.textColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
            
        case 1:
             authorLabel.textColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
            viewColor.layer.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1).cgColor
        case 2:
             viewColor.layer.backgroundColor = UIColor(displayP3Red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1).cgColor
        default:
            print("something went wrong")
        }
    }
    
    @IBAction func barBtnItem(_ sender: UIBarButtonItem) {
        switch sender.tag {
        case 0:
            UserDefaults.standard.set(color: viewColor.backgroundColor!, forKey: "viewColor")
            UserDefaults.standard.set(color: authorLabel.textColor, forKey: "authorColor")
            UserDefaults.standard.set(color: titleLabel.textColor, forKey: "titleColor")
        case 1:
            titleLabel.textColor = UIColor.black
            authorLabel.textColor = UIColor.black
            viewColor.backgroundColor = UIColor.white
            UserDefaults.standard.set(color: viewColor.backgroundColor!, forKey: "viewColor")
            UserDefaults.standard.set(color: authorLabel.textColor, forKey: "authorColor")
            UserDefaults.standard.set(color: titleLabel.textColor, forKey: "titleColor")
        default:
            print("something went wrong")
        }
    }
    
   
    
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
