//
//  EpisodeTableViewCell.swift
//  VmazeWebsite
//
//  Created by Pedro Valderrama on 24/02/2022.
//

import UIKit

class EpisodeTableViewCell: UITableViewCell {

    @IBOutlet weak var numberEpisodeLabel: UILabel!
    @IBOutlet weak var nameEpisodeLabel: UILabel!
    
    
    func setEpisodeData(_ episode: Episode) {
        numberEpisodeLabel.text = "\(episode.season) x \(episode.number)"
        nameEpisodeLabel.text = episode.name
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
