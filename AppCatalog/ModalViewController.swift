//
//  ModalViewController.swift
//  AppCatalog
//
//  Created by Kumarapperuma, Tharindu on 10/4/18.
//  Copyright © 2018 MADD. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    
    var appName: String = ""
    @IBOutlet weak var lblAppName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblAppName.text = appName
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
