//
//  HomeViewController.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/2/24.
//

import UIKit

class HomeViewController: UIViewController {
    let homeView = HomeView()
    
    override func loadView() {
        self.view = homeView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        homeView.tableView.delegate = self
        homeView.tableView.dataSource = self
        homeView.tableView.separatorStyle = .none
        homeView.tableView.register(TrendingTableViewCell.self, forCellReuseIdentifier: "Trending")
        homeView.tableView.register(TopAndPopularTableViewCell.self, forCellReuseIdentifier: "Top")
        
        requestToTMDB()
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return HomeSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HomeSection.allCases[section].numberOfRows
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return HomeSection.allCases[indexPath.section].heightRow
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = homeView.tableView.dequeueReusableCell(withIdentifier: "Trending") as! TrendingTableViewCell
            cell.selectionStyle = .none
            cell.configureView(item: HomeSection.list[indexPath.section][indexPath.row], index: indexPath.row)
            return cell
        } else {
            let cell = homeView.tableView.dequeueReusableCell(withIdentifier: "Top") as! TopAndPopularTableViewCell
            cell.selectionStyle = .none
            cell.collectionView.dataSource = self
            cell.collectionView.delegate = self
            cell.collectionView.register(TopAndPopularCollectionViewCell.self, forCellWithReuseIdentifier: "collection")
            cell.collectionView.reloadData()
            cell.collectionView.tag = indexPath.section
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 35
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = HeaderView()
        header.leftButton.setTitle(HomeSection.allCases[section].sectionHeaderTitle, for: .normal)
        header.leftButton.addTarget(self, action: #selector(headerClicked), for: .touchUpInside)
        header.leftButton.tag = section
        header.rightButton.addTarget(self, action: #selector(headerClicked), for: .touchUpInside)
        header.rightButton.tag = section
        return header
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView.tag == 1 { return HomeSection.list[1].count }
        else { return HomeSection.list[2].count }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection", for: indexPath) as! TopAndPopularCollectionViewCell
        
        if collectionView.tag == 1 { cell.configureView(item: HomeSection.list[1][indexPath.item]) }
        else { cell.configureView(item: HomeSection.list[2][indexPath.item]) }
        
        return cell
    }
}

extension HomeViewController {
    func requestToTMDB() {
        let group = DispatchGroup()
        
        group.enter()
        TMDBAPIManager.shared.fetchTVShows(api: .trending) { result in
            HomeSection.allTrendingList = result
            group.leave()
        }
        group.enter()
        TMDBAPIManager.shared.fetchTVShows(api: .topRated) { result in
            HomeSection.list[1] = result
            group.leave()
        }
        group.enter()
        TMDBAPIManager.shared.fetchTVShows(api: .popular) { result in
            HomeSection.list[2] = result
            group.leave()
        }
        group.notify(queue: .main) {
            HomeSection.top5Trending()
            self.homeView.tableView.reloadData()
        }
    }
    @objc func headerClicked(_ sender: UIButton) {
        if sender.tag == 0 {
            print(sender.tag)
            let vc = TrendingViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
