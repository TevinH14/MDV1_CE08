//
//  SubRedditViewController.swift
//  HamiltonTevin_CE04
//
//  Created by Tevin Hamilton on 9/25/19.
//  Copyright © 2019 Tevin Hamilton. All rights reserved.
//

import UIKit

class SubRedditViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    var CurrentSubReddit = [String]()
    @IBOutlet weak var subRedditTF: UITextField!
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    //MARK: - Table View Cell
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CurrentSubReddit.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
           let cell = tableView.dequeueReusableCell(withIdentifier: "cell_ID_2", for: indexPath)
        cell.textLabel?.text = CurrentSubReddit[indexPath.row]
        return cell
      }
    @IBAction func AddBtn(_ sender: UIButton)
    {
        if subRedditTF.text != ""
        {
            CurrentSubReddit.append(String((subRedditTF.text)!))
            
            tableView.reloadData()
        }
       
        
    }
    @IBAction func BarBtnItem(_ sender: UIBarButtonItem)
    {
        if sender.tag == 0
        {
            UserDefaults.standard.set(CurrentSubReddit, forKey: "subReddit")
        }
        else if sender.tag == 1
        {
            UserDefaults.standard.set("iphone", forKey: "subReddit")
           
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
