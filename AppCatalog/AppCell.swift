//
//  App.swift
//  AppCatalog
//
//  Created by Kumarapperuma, Tharindu on 10/3/18.
//  Copyright © 2018 MADD. All rights reserved.
//

import UIKit

class AppCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCreator: UILabel!
    @IBOutlet weak var imgAppIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
