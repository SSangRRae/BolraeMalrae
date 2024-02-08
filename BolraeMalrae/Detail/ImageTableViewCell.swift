//
//  ImageTableViewCell.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/5/24.
//

import UIKit

final class ImageTableViewCell: UITableViewCell {
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
    let posterImage = PosterImageView(frame: .zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ImageTableViewCell {
    private func configureHierarchy() {
        contentView.addSubview(backdropImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(originLabel)
        contentView.addSubview(posterImage)
    }
    
    func configureView(item: TV) {
        if let backdrop = item.backdrop {
            backdropImage.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(backdrop)"))
        } else {
            backdropImage.layer.borderColor = UIColor.black.cgColor
            backdropImage.layer.borderWidth = 1
            backdropImage.image = UIImage(systemName: "xmark")
            backdropImage.tintColor = .black
        }
        posterImage.configureImage(poster: item.poster)
        titleLabel.text = item.name
        originLabel.text = item.originalName
    }

    private func configureConstraints() {
        backdropImage.snp.makeConstraints { make in
            make.height.equalTo(270)
            make.edges.equalTo(contentView)
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
    }
}
