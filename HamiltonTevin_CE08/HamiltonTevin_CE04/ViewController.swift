//
//  ViewController.swift
//  HamiltonTevin_CE04
//
//  Created by Tevin Hamilton on 9/13/19.
//  Copyright © 2019 Tevin Hamilton. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    //an array to hold objects
    var redditData = [Reddit]()
    var subRedditArray:[String] = ["iphone"]
    var FilteredArray:[[Reddit]] = []
    var  activityIndicator: UIActivityIndicatorView =  UIActivityIndicatorView()
    var titleColor = UIColor.black
    var authorColor = UIColor.black
    var viewColor = UIColor.white
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if let sub = UserDefaults.standard.object(forKey: "subReddit") as? [String]
        {
            subRedditArray.removeAll()
            subRedditArray = sub
        }
        if let colorView = UserDefaults.standard.color(forKey: "viewColor")
        {
            if let colorTitle = UserDefaults.standard.color(forKey: "titleColor")
            {
                if let colorAuthor = UserDefaults.standard.color(forKey: "authorColor")
                {
                    titleColor = colorTitle
                    authorColor = colorAuthor
                    viewColor = colorView
                }
            }
        }
        updateData()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    
    //MARK: Section Edit
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return subRedditArray.count
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return subRedditArray[section]
    }
    
    //MARK: Cell Edit
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //reuse an existing cell or create a new one
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell_ID_1", for: indexPath)
        let currentReddit = FilteredArray[indexPath.section][indexPath.row]
        
        
        // add data from object array
        cell.textLabel?.text = currentReddit.title
        cell.detailTextLabel?.text = currentReddit.author
        cell.imageView?.image = currentReddit.thumbnail
        cell.textLabel?.textColor = titleColor
        cell.detailTextLabel?.textColor = authorColor
        cell.backgroundColor = viewColor
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return the count of the array
        AddToFilteredArray()
        return FilteredArray[section].count
    }
    
    //MARK: Parse Api's
    func updateData()
    {
        FilteredArray.reserveCapacity(subRedditArray.count)
        let serialQueue = DispatchGroup()
        
        
        DispatchQueue.global().async {
            for item in self.subRedditArray {
                serialQueue.enter()
                self.downloadAndParse(subreddit: item)
                // serialQueue.wait()
                serialQueue.leave()
            }
            
            
        }
        
        self.tableView.reloadData()
    }
    
    //
    func AddToFilteredArray() {
        var counter = 0
        
        view.addSubview(activityIndicator)
        for currentSubReddit in subRedditArray
        {
            
            FilteredArray.insert(self.redditData.filter({ $0.subReddit == currentSubReddit }), at: counter)
            counter += 1
        }
    }
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? SubRedditViewController
        {
            destination.CurrentSubReddit = subRedditArray
        }
    }
    @IBAction func unwindFromTheme(segue: UIStoryboardSegue)
    {
        redditData.removeAll()
        if let updateColor = segue.source as? ThemeViewController
        {
            
            titleColor = updateColor.titleLabel.textColor
            authorColor = updateColor.authorLabel.textColor
            viewColor = updateColor.viewColor.backgroundColor!
            updateData()
            tableView.reloadData()
        }
    }
    
    @IBAction func unwindToViewController(segue: UIStoryboardSegue)
    {
        redditData.removeAll()
        if let updateArray = segue.source as? SubRedditViewController
        {
            
            subRedditArray = updateArray.CurrentSubReddit
            updateData()
            tableView.reloadData()
        }
    }
    
}


