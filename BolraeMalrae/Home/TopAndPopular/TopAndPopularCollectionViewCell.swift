//
//  TopratedCollectionViewCell.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/3/24.
//

import UIKit

class TopAndPopularCollectionViewCell: UICollectionViewCell {
    let posterImage: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    let title: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 15)
        view.textAlignment = .center
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("TopratedCollectionViewCell Error")
    }
}

extension TopAndPopularCollectionViewCell {
    func configureHierarchy() {
        contentView.addSubview(posterImage)
        contentView.addSubview(title)
    }
    
    func configureView(item: TV) {
        if let poster = item.poster {
            posterImage.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(poster)"))
        } else {
            posterImage.layer.borderColor = UIColor.black.cgColor
            posterImage.layer.borderWidth = 1
            posterImage.image = UIImage(systemName: "xmark")
            posterImage.tintColor = .black
        }
        title.text = item.name
    }

    func configureConstraints() {
        posterImage.snp.makeConstraints { make in
            make.top.equalTo(contentView)
            make.horizontalEdges.equalTo(contentView)
            make.height.equalTo(200)
        }
        title.snp.makeConstraints { make in
            make.top.equalTo(posterImage.snp.bottom).offset(8)
            make.horizontalEdges.equalTo(contentView)
            make.height.equalTo(22)
        }
    }
}