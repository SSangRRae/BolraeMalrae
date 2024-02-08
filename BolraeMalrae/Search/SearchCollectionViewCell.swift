//
//  SearchCollectionViewCell.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/5/24.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    let posterImage = PosterImageView(frame: .zero)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImage)
        posterImage.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureView(item: TV) {
        posterImage.configureImage(poster: item.poster)
    }
    
    func configureView(url: String) {
        let url = URL(string: url)
        posterImage.kf.setImage(with: url)
    }
}
