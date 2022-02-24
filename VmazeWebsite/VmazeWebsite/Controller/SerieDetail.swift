//
//  ViewController.swift
//  VmazeWebsite
//
//  Created by Pedro Valderrama on 10/02/2022.
//

import UIKit

class SerieViewController: UIViewController {

    @IBOutlet weak var serieDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func buttonTap(_ sender: Any) {
        NetworkingProvider.shared.getSerie(id: 1)
    }
    
    
}

