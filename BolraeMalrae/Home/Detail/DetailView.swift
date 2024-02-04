//
//  DetailView.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/4/24.
//

import UIKit

class DetailView: UIView {
    let backdropImage: UIImageView = {
        let view = UIImageView()
        view.alpha = 0.3
        return view
    }()
    let titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .boldSystemFont(ofSize: 20)
        view.numberOfLines = 2
        return view
    }()
    let originLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 12)
        return view
    }()
    let posterImage: UIImageView = {
        let view = UIImageView()
        return view
    }()
    let tableView: UITableView = {
        let view = UITableView(frame: .zero, style: .grouped)
        view.backgroundColor = .clear        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .white
        configureHierarchy()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

extension DetailView {
    func configureHierarchy() {
        addSubview(backdropImage)
        addSubview(titleLabel)
        addSubview(originLabel)
        addSubview(posterImage)
        addSubview(tableView)
    }
    
    func configureView(item: TV) {
        if let backdrop = item.backdrop {
            backdropImage.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(backdrop)"))
        } else {
            backdropImage.image = UIImage(systemName: "xmark")
        }
        if let poster = item.poster {
            posterImage.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(poster)"))
        } else {
            posterImage.image = UIImage(systemName: "xmark")
        }
        titleLabel.text = item.name
        originLabel.text = item.originalName
    }

    func configureConstraints() {
        backdropImage.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(safeAreaLayoutGuide)
            make.height.equalTo(270)
        }
        posterImage.snp.makeConstraints { make in
            make.trailing.equalTo(backdropImage.snp.trailing).inset(16)
            make.bottom.equalTo(backdropImage.snp.bottom).inset(16)
            make.width.equalTo(100)
            make.height.equalTo(150)
        }
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(posterImage.snp.top)
            make.leading.equalTo(backdropImage.snp.leading).offset(32)
            make.width.equalTo(200)
        }
        originLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(8)
            make.leading.equalTo(titleLabel.snp.leading)
            make.width.equalTo(200)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(backdropImage.snp.bottom)
            make.horizontalEdges.bottom.equalTo(safeAreaLayoutGuide)
        }
    }
}
