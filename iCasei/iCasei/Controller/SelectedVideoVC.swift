//
//  SelectedVideoVC.swift
//  iCasei
//
//  Created by ely.assumpcao.ndiaye on 08/05/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit

class SelectedVideoVC: UIViewController {
    
    @IBOutlet weak var imageVideo: UIImageView!
    @IBOutlet weak var tituloLbl: UILabel!
    @IBOutlet weak var descricaoLbl: UILabel!
    @IBOutlet weak var likesLbl: UILabel!
    @IBOutlet weak var deslikesLbl: UILabel!
    @IBOutlet weak var visualizationLbl: UILabel!
    @IBOutlet weak var descriptionTxtArea: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       setupView()
    }
    
    func setupView() {
        
        let Title = searchServices.instance.title ?? ""
        tituloLbl.text = Title
        
        let Description = searchServices.instance.description ?? ""
        //descricaoLbl.text = Description
        descriptionTxtArea.text = Description
        
        let Image = searchServices.instance.Img ?? ""
        let url = URL(string: Image)
        let data = try? Data(contentsOf: url!)
        if let imageData = data {
            imageVideo.image = UIImage(data: imageData)
        }
        
        let Likes = searchServices.instance.likes ?? ""
        likesLbl.text = "Likes: \(Likes)"
        
        let Deslikes = searchServices.instance.deslikes ?? ""
        deslikesLbl.text = "Deslikes: \(Deslikes)"
        
        let Visualization = searchServices.instance.viewCount ?? ""
        visualizationLbl.text = "ViewCount: \(Visualization)"
    }
    
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        searchServices.instance.clear()
    }
    
}
