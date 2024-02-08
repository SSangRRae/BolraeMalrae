//
//  HomeViewController.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/2/24.
//

import UIKit

final class HomeViewController: UIViewController {
    final let homeView = HomeView()
    
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
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBar.isHidden = true
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return HomeSection.allCases.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HomeSection.allCases[section].numberOfRows
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
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = HeaderView()
        if section == 0 {
            header.leftButton.addTarget(self, action: #selector(headerClicked), for: .touchUpInside)
            header.rightButton.addTarget(self, action: #selector(headerClicked), for: .touchUpInside)
        } else {
            header.rightButton.isHidden = true
        }
        header.leftButton.setTitle(HomeSection.allCases[section].sectionHeaderTitle, for: .normal)
        header.leftButton.tag = section
        header.rightButton.tag = section
        return header
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.tvShow = HomeSection.list[indexPath.section][indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return HomeSection.list[collectionView.tag].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collection", for: indexPath) as! TopAndPopularCollectionViewCell
        cell.configureView(item: HomeSection.list[collectionView.tag][indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.tvShow = HomeSection.list[collectionView.tag][indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension HomeViewController {
    private func requestToTMDB() {
        let group = DispatchGroup()
        
        group.enter()
        TMDBSessionManager.shared.fetchTrendingTVShows(api: .trending) { result, error in
            if let error = error {
                print(error.rawValue)
            } else {
                if let result = result {
                    HomeSection.allTrendingList = result.results
                }
            }
            group.leave()
        }
        group.enter()
        TMDBSessionManager.shared.fetchTrendingTVShows(api: .topRated) { result, error in
            if let error = error {
                print(error.rawValue)
            } else {
                if let result = result {
                    HomeSection.list[1] = result.results
                }
            }
            group.leave()
        }
        group.enter()
        TMDBSessionManager.shared.fetchTrendingTVShows(api: .popular) { result, error in
            if let error = error {
                print(error.rawValue)
            } else {
                if let result = result {
                    HomeSection.list[2] = result.results
                }
            }
            group.leave()
        }
        group.notify(queue: .main) {
            HomeSection.top5Trending()
            self.homeView.tableView.reloadData()
        }
    }
    @objc private func headerClicked(_ sender: UIButton) {
        if sender.tag == 0 {
            print(sender.tag)
            let vc = TrendingViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
