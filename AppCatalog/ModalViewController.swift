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
    @IBOutlet weak var imgPopupApp: UIImageView!
    @IBOutlet weak var lblCompany: UILabel!
    @IBOutlet weak var lblType: UILabel!
    @IBOutlet weak var lblGenre: UILabel!
    var selectedApp: AppModel = AppModel()
    
    @IBOutlet weak var lblPrice: UILabel!
    
    
    @IBAction func btnCloseClicked(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.lblAppName.text = self.selectedApp.trackName
        
        if let artworkUrl = URL(string: self.selectedApp.artworkUrl60) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: artworkUrl)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        self.imgPopupApp.image = image
                    }
                }
            }
        }
        
        self.lblCompany.text = self.selectedApp.sellerName
        self.lblType.text = "Type: " + self.selectedApp.wrapperType
        self.lblGenre.text = self.selectedApp.primaryGenreName
        self.lblPrice.text = self.selectedApp.formattedPrice
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
