//
//  SerieDetailsViewController.swift
//  VmazeWebsite
//
//  Created by Pedro Valderrama on 21/02/2022.
//

import UIKit
import Kingfisher


class SerieDetailsViewController: UIViewController {
    
    var actualSerie: Serie?
    
    @IBOutlet weak var nameSerieLabel: UILabel!
    @IBOutlet weak var posterSerieImage: UIImageView!
    @IBOutlet weak var summarySerieTextView: UITextView!
    
    override func viewDidLoad() {
        nameSerieLabel.text = actualSerie?.name
        summarySerieTextView.text = actualSerie?.summary
        if let urlString = actualSerie?.image?.medium {
            posterSerieImage.kf.setImage(with: URL(string: urlString))

        }
    }
}
