//
//  PosterImageView.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/5/24.
//

import UIKit

final class PosterImageView: UIImageView {
    let posterImage: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(posterImage)
        posterImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configureImage(poster: String?) {
        if let poster = poster {
            posterImage.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(poster)"))
        } else {
            posterImage.layer.borderColor = UIColor.black.cgColor
            posterImage.layer.borderWidth = 1
            posterImage.image = UIImage(systemName: "xmark")
            posterImage.tintColor = .black
        }
    }
}
