//
//  ViewController.swift
//  VmazeWebsite
//
//  Created by Pedro Valderrama on 10/02/2022.
//

import UIKit

class SerieViewController: UIViewController {

    @IBOutlet weak var serieTableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var serieList: [Serie] = []
    var searchSerie: [SearchSerie] = []
    
    func tableData() {
        NetworkingProvider.shared.getSerie() { [weak self] seriesResult in
            guard let serieData = seriesResult else {
                return
            }
            self?.serieList = serieData
            self?.serieTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        serieTableView.dataSource = self
        serieTableView.delegate = self
        let cellNib = UINib(nibName: "SerieTableViewCell", bundle: nil)
        serieTableView.register(cellNib, forCellReuseIdentifier: "serieListCell")
        tableData()
    }
}

extension SerieViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !serieList.isEmpty {
           return serieList.count
        } else {
            return searchSerie.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "serieListCell") as? SerieTableViewCell else {
        return UITableViewCell()
        }
        if !serieList.isEmpty {
        cell.setData(serieList[indexPath.row])
        } else {
            cell.setDataSearch(searchSerie[indexPath.row])
        }
        
    return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(identifier: "SerieDetailsViewController") as? SerieDetailsViewController {
        
            if !serieList.isEmpty {
                vc.actualSerie = serieList[indexPath.row]
            } else {
                vc.actualSerie = searchSerie[indexPath.row].show
            }
            
            navigationController?.pushViewController(vc, animated: false)
        }
    }
}

extension SerieViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        guard let text = searchBar.text, !text.isEmpty else { return }
        
        NetworkingProvider.shared.getSerieByName(serieName: text) { [weak self] seriesResult in
            guard let serieData = seriesResult else { return }
            
            self?.searchSerie = serieData
            self?.serieList.removeAll()
            self?.serieTableView.reloadData()
        }
    }
}

