//
//  JSONViewController.swift
//  JSON Codable
//
//  Created by Felipe Costa on 9/6/19.
//  Copyright © 2019 Felipe Costa. All rights reserved.
//

import UIKit

class JSONViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        loadJSON()
        // Do any additional setup after loading the view.
    }
    
    func loadJSON(){
        let url = URL(string: "https://dalemusser.com/code/examples/data/nocaltrip/photos.json")!
        let task = URLSession.shared.downloadTask(with: url) { localURL, urlResponse, error in
            if let localURL = localURL {
                do{
                    let data = try Data(contentsOf: localURL)
                    let decoder = JSONDecoder()
                    let json = try decoder.decode(Photos.self, from: data)
                    print (json)
                }
                catch{
                   print("Error")
                }
            }
        }
        
        task.resume()
    }

}
