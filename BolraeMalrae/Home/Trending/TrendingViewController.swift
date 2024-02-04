//
//  TrendingViewController.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/4/24.
//

import UIKit
import SnapKit

class TrendingViewController: UIViewController {
    let titleLabel: UILabel = {
        let view = UILabel()
        view.text = "이번주 트렌딩 순위"
        view.font = .boldSystemFont(ofSize: 20)
        view.textColor = .black
        return view
    }()
    let tableView: UITableView = {
        let view = UITableView()
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureHierarchy()
        configureViews()
        configureConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
}

extension TrendingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HomeSection.allTrendingList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Trending", for: indexPath) as! TrendingTableViewCell
        cell.configureView(item: HomeSection.allTrendingList[indexPath.row], index: indexPath.row)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        vc.tvShow = HomeSection.allTrendingList[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension TrendingViewController {
    func configureHierarchy() {
        view.addSubview(titleLabel)
        view.addSubview(tableView)
    }
    
    func configureViews() {
        view.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TrendingTableViewCell.self, forCellReuseIdentifier: "Trending")
    }
    
    func configureConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(view.safeAreaLayoutGuide).offset(8)
            make.height.equalTo(22)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(16)
            make.horizontalEdges.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
}
