//
//  TableViewCell.swift
//  HydroHouse
//
//  Created by Javier Quintero on 8/12/17.
//  Copyright © 2017 Javier Quintero. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var airTempLabel: UILabel!
    @IBOutlet weak var unitLabel: UILabel!
    @IBOutlet weak var waterTempLabel: UILabel!
    @IBOutlet weak var phLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
