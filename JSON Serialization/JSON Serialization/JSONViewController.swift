//
//  JSONViewController.swift
//  JSON Serialization
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
                    let json = try JSONSerialization.jsonObject(with: data, options: []) as! [String:Any]
                    
                    if(json["status"] as! String == "ok"){
                        let photos = Photos(status: "ok", path: json["photosPath"] as! String, photosObj: json["photos"] as! [[String: Any]] )
                        print(photos.photos)
                    }
                    
                }
                catch{
                    print("Error creating json")
                }
            }
        }
        
        task.resume()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}
