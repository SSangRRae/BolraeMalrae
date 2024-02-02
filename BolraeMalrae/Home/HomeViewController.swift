//
//  HomeViewController.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/2/24.
//

import UIKit

class HomeViewController: UIViewController {
    let homeView = HomeView()
    
    var allTrendingList: [Trending] = []
    var top5TrendingList: [Trending] = []
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeView.tableView.delegate = self
        homeView.tableView.dataSource = self
        homeView.tableView.register(TrendingTableViewCell.self, forCellReuseIdentifier: "Trending")
        
        let group = DispatchGroup()
        
        group.enter()
        TMDBAPIManager.shared.fetchTrendingTVShows(api: .trending) { result in
            self.allTrendingList = result
            group.leave()
        }
        
        group.notify(queue: .main) {
            for i in 0...4 {
                self.top5TrendingList.append(self.allTrendingList[i])
            }
            self.homeView.tableView.reloadData()
        }
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return top5TrendingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = homeView.tableView.dequeueReusableCell(withIdentifier: "Trending") as! TrendingTableViewCell
        
        cell.configureView(item: top5TrendingList[indexPath.row], index: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let trendingHeader = TrendingHeaderView()
        trendingHeader.button.addTarget(self, action: #selector(trendingClicked), for: .touchUpInside)
        return trendingHeader
    }
}

extension HomeViewController {
    @objc func trendingClicked() {
        print("ddd")
    }
}
