//
//  DetailViewController.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/4/24.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    let detailView = DetailView()
    var tvShow: TV = TV(id: 0, name: "", overview: "", originalName: "", backdrop: "", poster: "")
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailView.configureView(item: tvShow)
        detailView.tableView.delegate = self
        detailView.tableView.dataSource = self
        detailView.tableView.register(OverviewTableViewCell.self, forCellReuseIdentifier: "overview")
        detailView.tableView.register(CastTableViewCell.self, forCellReuseIdentifier: "cast")
        
        TMDBAPIManager.shared.fetchTVShowCasts(api: .cast(id: tvShow.id)) { result in
            DetailSection.castList = result
            self.detailView.tableView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return DetailSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DetailSection.allCases[section].numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "overview", for: indexPath) as! OverviewTableViewCell
            cell.textView.text = tvShow.overview
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cast", for: indexPath) as! CastTableViewCell
            cell.configureViews(item: DetailSection.castList[indexPath.row])
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return DetailSection.allCases[section].sectionHeaderTitle
    }
}
