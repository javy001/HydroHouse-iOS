//
//  CabinetListTableViewController.swift
//  HydroHouse
//
//  Created by Javier Quintero on 8/8/17.
//  Copyright © 2017 Javier Quintero. All rights reserved.
//

import UIKit


class CabinetListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var cabinets: [String] = []
    var cabinetData: [String:[String: Double]] = [:]
    
    @IBOutlet weak var table: UITableView!
    
    @IBOutlet weak var airTempLabel: UILabel!
    
    
    
    
    func getCabinets() {
        guard let url = URL(string: "http://ec2-54-68-139-60.us-west-2.compute.amazonaws.com/app/get_data.php?all") else {
            return
        }
        let urlRequest = URLRequest(url: url)
        let session = URLSession.shared
        let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
                print("error calling GET on /todos/1")
                print(error!)
                return
            }
            // make sure we got data
            guard let responseData = data else {
                print("Error: did not receive data")
                return
            }
            // parse the result as JSON, since that's what the API provides
            do {
                guard let json = try JSONSerialization.jsonObject(with: responseData, options: [])
                as? [String: [String: Any]] else {
                        print("error trying to convert data to JSON")
                        return
                }
                
                
                for (name,value) in json {
                    self.cabinetData[name] = value["data"] as? [String : Double]
                    self.cabinets.append(name)
                    
                    
                }
                OperationQueue.main.addOperation {
                    self.table.reloadData()
                }
                
                
            } catch  {
                print("error trying to convert data to JSON")
                return
            }
        }
        task.resume()
        
    }

    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getCabinets()
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return cabinets.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "customCell", for: indexPath) as! TableViewCell
        let unit = cabinets[indexPath.row]
//        cell.airTempLabel.text = "Air Temp: " + String(describing: (cabinetData[unit]?["IAT"])!)
        cell.waterTempLabel.text = "Water Temp: " + String(describing: (cabinetData[unit]?["WT"])!)
//        cell.humidityLabel.text = "Humidity : " + String(describing: (cabinetData[unit]?["IAH"])!) + "%"
        cell.phLabel.text = "pH : " + String(describing: (cabinetData[unit]?["pH"])!)
        cell.unitLabel.text = unit

        return cell
    }
    

}
