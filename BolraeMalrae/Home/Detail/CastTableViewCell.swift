//
//  CastTableViewCell.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/4/24.
//

import UIKit

class CastTableViewCell: UITableViewCell {
    
    let profileImage = UIImageView()
    let nameLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 16)
        return view
    }()
    let roleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .systemGray
        view.font = .systemFont(ofSize: 13)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        contentView.addSubview(profileImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(roleLabel)
    }
    
    func configureViews(item: Cast) {
        if let profile = item.profile {
            profileImage.kf.setImage(with: URL(string: "https://image.tmdb.org/t/p/w500/\(profile)"))
        } else {
            profileImage.image = UIImage(systemName: "xmark")
        }
        
        nameLabel.text = item.name
        roleLabel.text = item.roles[0].character
    }
    
    func configureConstraints() {
        profileImage.snp.makeConstraints { make in
            make.leading.equalTo(contentView).offset(16)
            make.width.equalTo(50)
            make.height.equalTo(60)
            make.top.equalTo(contentView.snp.top).offset(8)
            make.bottom.equalTo(contentView.snp.bottom).offset(-8)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImage.snp.trailing).offset(16)
            make.bottom.equalTo(contentView.snp.centerY)
        }
        
        roleLabel.snp.makeConstraints { make in
            make.leading.equalTo(profileImage.snp.trailing).offset(16)
            make.top.equalTo(contentView.snp.centerY)
        }
    }
}
