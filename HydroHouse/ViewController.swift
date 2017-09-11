//
//  ViewController.swift
//  HydroHouse
//
//  Created by Javier Quintero on 7/29/17.
//  Copyright © 2017 Javier Quintero. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    let cabinets = ["Unit 1","Unit 2","Unit 3","Unit 4"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return(cabinets.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "customCell")
        cell.textLabel?.text = cabinets[indexPath.row]
        return(cell)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        let gradientLayer = CAGradientLayer()
//        gradientLayer.frame = self.view.frame
//        gradientLayer.colors = [UIColor(red: 0/255.5, green: 110/255.5, blue: 196/255.5, alpha: 1.0 ).cgColor,
//        UIColor(red: 117/255.5, green: 195/255.5, blue: 255/255.5, alpha: 1.0 ).cgColor]
//        gradientLayer.locations = [0.0, 1.0]
//        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
//        gradientLayer.endPoint = CGPoint(x: 0.0, y: 1.0)
//        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        
        
    }

    


}

