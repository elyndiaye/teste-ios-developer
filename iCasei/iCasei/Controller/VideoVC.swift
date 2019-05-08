//
//  VideoVC.swift
//  iCasei
//
//  Created by ely.assumpcao.ndiaye on 08/05/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit

class VideoVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var searchTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchTable.delegate = self
        searchTable.dataSource = self

        // Do any additional setup after loading the view.
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("rows",searchServices.instance.apiResults.count)
        return searchServices.instance.apiResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "resultSearchCell")  as? resultSearchCell {
            let apiResult = searchServices.instance.apiResults[indexPath.row]
            cell.configureCell(apiResult: apiResult)
            return cell
        }//if cell
        else {
            return resultSearchCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let video = searchServices.instance.apiResults[indexPath.row]

        searchServices.instance.findVideo(videoID: video.videoId) { (success,errorMessage) in
            if success{
                print ("foi")
                self.performSegue(withIdentifier:TO_SELECTED_VIDEO , sender: video)
            }
            else{
                let message = errorMessage
                print(message)
            }
        }
    }
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        searchServices.instance.clearAll()
    }
    
}
