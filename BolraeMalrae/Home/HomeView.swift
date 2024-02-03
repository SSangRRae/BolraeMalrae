//
//  HomeView.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/2/24.
//

import UIKit
import SnapKit

class HomeView: UIView {
    let logoImageView: UIImageView = {
        let view = UIImageView()
        view.image = .logo
        view.contentMode = .scaleToFill
        return view
    }()
    let tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.backgroundColor = .clear
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureView()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("HomeView Required Init Error")
    }
    
    func configureHierarchy() {
        addSubview(logoImageView)
        addSubview(tableView)
    }
    
    func configureView() {
        backgroundColor = .systemBackground
    }
    
    func configureConstraints() {
        logoImageView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).inset(8)
            make.centerX.equalTo(safeAreaLayoutGuide)
            make.width.equalTo(150)
            make.height.equalTo(50)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(logoImageView.snp.bottom).offset(16)
            make.bottom.horizontalEdges.equalTo(safeAreaLayoutGuide)
        }
    }
}
