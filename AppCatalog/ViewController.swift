//
//  ViewController.swift
//  AppCatalog
//
//  Created by Kumarapperuma, Tharindu on 10/2/18.
//  Copyright © 2018 MADD. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    final let url = URL(string: "https://itunes.apple.com/search?term=Puzzle&limit=200&entity=software")

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    func fetchData() {
        guard let apiUrl = url else { return }
        URLSession.shared.dataTask(with: apiUrl) { (data, response, error) in
            print("Retrieved apps list")
        }.resume()
    }

}

