//
//  SerieDetailsViewController.swift
//  VmazeWebsite
//
//  Created by Pedro Valderrama on 21/02/2022.
//

import UIKit
import Kingfisher

typealias EpisodesBySeason = (season: Int, episodes: [Episode])

class SerieDetailsViewController: UIViewController {
    
    var actualSerie: Serie?
    var episodesBySeason: [EpisodesBySeason] = []
    
    @IBOutlet weak var nameSerieLabel: UILabel!
    @IBOutlet weak var posterSerieImage: UIImageView!
    @IBOutlet weak var summarySerieTextView: UITextView!
    @IBOutlet weak var episodesTableView: UITableView!
    
    
    func episodesData() {
        
        guard let ID = actualSerie?.id else { return }
        
        NetworkingProvider.shared.getEpisode(serieID: ID) { [weak self] episodesResult in
            guard let episodesData = episodesResult else { return }
            self?.seasonCount(episodesData)
            self?.episodesTableView.reloadData()
//            print(self?.episodes.count)
        }
    }
    
    func seasonCount(_ episodes: [Episode] ) -> [EpisodesBySeason] {
        var count = 1
        
        let seasons = episodes.map { $0.season }
        let seasonsSet = Set(seasons)
        print(seasons)
        print(seasonsSet)
        
        var episodesFiltered: [EpisodesBySeason] = []
        var currentEpisode = 0
        var currentIndex = -1
        episodes.forEach { episode in
            if episode.season == currentEpisode {
                episodesFiltered[currentIndex].episodes.append(episode)
            } else {
                currentEpisode = episode.season
                currentIndex += 1
                let tuple = EpisodesBySeason(season: episode.season, episodes: [episode])
                episodesFiltered.append(tuple)
            }
        }
        
        episodesBySeason = episodesFiltered
        print(episodesFiltered)
        return episodesFiltered
    }
    
    override func viewDidLoad() {
        nameSerieLabel.text = actualSerie?.name
        summarySerieTextView.text = actualSerie?.summary
        if let urlString = actualSerie?.image?.medium {
            posterSerieImage.kf.setImage(with: URL(string: urlString))

        }
        episodesTableView.dataSource = self
        episodesTableView.delegate = self
        episodesData()
        let cellNib = UINib(nibName: "EpisodeTableViewCell", bundle: nil)
        episodesTableView.register(cellNib, forCellReuseIdentifier: "episodeTableViewCell")
    }
}

extension SerieDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        episodesBySeason.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        episodesBySeason[section].episodes.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Season: \(episodesBySeason[section].season)"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "episodeTableViewCell") as? EpisodeTableViewCell else { return UITableViewCell() }
        let episode = episodesBySeason[indexPath.section].episodes[indexPath.row]
        cell.setEpisodeData(episode)
        
      return cell
    }
}
