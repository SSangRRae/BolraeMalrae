//
//  TrendingTableViewCell.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/2/24.
//

import UIKit
import SnapKit
import Kingfisher

final class TrendingTableViewCell: UITableViewCell {
    let rankLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .boldSystemFont(ofSize: 17)
        view.textAlignment = .center
        return view
    }()
    let posterImage = PosterImageView(frame: .zero)
    let title: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 17)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("TrendingTableViewCell Required Init Error")
    }
}

extension TrendingTableViewCell {
    private func configureHierarchy() {
        contentView.addSubview(rankLabel)
        contentView.addSubview(posterImage)
        contentView.addSubview(title)
    }
    
    func configureView(item: TV, index: Int) {
        rankLabel.text = "\(index + 1)"
        posterImage.configureImage(poster: item.poster)
        title.text = item.name
    }
    
    private func configureConstraints() {
        rankLabel.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(contentView.safeAreaLayoutGuide).offset(16)
            make.size.equalTo(22)
        }
        posterImage.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(rankLabel.snp.trailing).offset(16)
            make.width.equalTo(40)
            make.height.equalTo(50)
            make.verticalEdges.equalTo(contentView).inset(8)
        }
        title.snp.makeConstraints { make in
            make.centerY.equalTo(contentView)
            make.leading.equalTo(posterImage.snp.trailing).offset(16)
            make.trailing.equalTo(contentView.safeAreaLayoutGuide).offset(-16)
            make.height.equalTo(22)
        }
    }
}
