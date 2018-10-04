//
//  ViewController.swift
//  AppCatalog
//
//  Created by Kumarapperuma, Tharindu on 10/2/18.
//  Copyright © 2018 MADD. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UISearchBarDelegate, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var url = URL(string: "https://itunes.apple.com/search?term=Puzzle&limit=200&entity=software")
    private var apps = [AppModel]()
    @IBOutlet weak var searchBar: UISearchBar!
    var selectedApp: AppModel = AppModel()
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apps.count
    }
    
    func searchBarSearchButtonClicked( _ searchBar: UISearchBar)
    {
        let searchKey: String = searchBar.text!
        print(searchKey)
        url = URL(string: "https://itunes.apple.com/search?term=\(searchKey)&limit=200&entity=software")
        fetchData()
        self.tableView.reloadData()
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(apps[indexPath.row].trackName)
        selectedApp = apps[indexPath.row]

        self.performSegue(withIdentifier: "appDescriptionModal", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // get a reference to the second view controller
        let modalViewContoller = segue.destination as! ModalViewController
        
        modalViewContoller.appName = selectedApp.trackName
        modalViewContoller.selectedApp = selectedApp
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AppCell") as? AppCell else {
            return UITableViewCell()
        }
        cell.lblName.text = apps[indexPath.row].trackName
        cell.lblCreator.text = apps[indexPath.row].sellerName
        
        if let artworkUrl = URL(string: apps[indexPath.row].artworkUrl60) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: artworkUrl)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imgAppIcon.image = image
                    }
                }
            }
        }
        
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        fetchData()
    }
    
    func fetchData() {
        guard let apiUrl = url else { return }
        URLSession.shared.dataTask(with: apiUrl) { (data, response, error) in
            guard let data = data, error == nil, response != nil else {
                print("Error retrieving apps list")
                return
            }
            print("Retrieved apps list")
            
            do {
                let decoder = JSONDecoder()
                let results = try decoder.decode(Results.self, from: data)
                self.apps = results.results
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } catch {
                print(error)
            }
        }.resume()
    }

}

