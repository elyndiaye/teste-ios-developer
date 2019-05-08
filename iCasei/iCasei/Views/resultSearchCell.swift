//
//  resultSearchCell.swift
//  iCasei
//
//  Created by ely.assumpcao.ndiaye on 08/05/19.
//  Copyright © 2019 ely.assumpcao.ndiaye. All rights reserved.
//

import UIKit

class resultSearchCell: UITableViewCell {

    @IBOutlet weak var videoImage: UIImageView!
    @IBOutlet weak var tituloLbl: UILabel!
    @IBOutlet weak var DescriptionLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(apiResult : ApiResult) {
        
        let Title = apiResult.title ?? ""
        tituloLbl.text = Title
        
        let Description = apiResult.description ?? ""
        DescriptionLbl.text = Description
        
        let Image = apiResult.thumbnails ?? ""
        let url = URL(string: Image)
        let data = try? Data(contentsOf: url!)
        if let imageData = data {
            videoImage.image = UIImage(data: imageData)
        }
        
    }//ConfigureCell

}
