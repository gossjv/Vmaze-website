//
//  SerieDetailTableViewCell.swift
//  VmazeWebsite
//
//  Created by Pedro Valderrama on 14/02/2022.
//

import UIKit
import Kingfisher

class SerieTableViewCell: UITableViewCell {

    @IBOutlet weak var nameSerieLabel: UILabel!
    @IBOutlet weak var posterSerieImage: UIImageView!
    var imageUrl: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setData(_ serie: Serie){
        nameSerieLabel.text = serie.name
        if let text = serie.image?.medium {
            posterSerieImage.kf.setImage(with: URL(string: text))
        }
    }
    
    func setDataSearch(_ serie: SearchSerie){
        nameSerieLabel.text = serie.show.name
        if let text = serie.show.image?.medium {
            posterSerieImage.kf.setImage(with: URL(string: text))
        }
    }
     
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
