//
//  CastTableViewCell.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/4/24.
//

import UIKit

final class CastTableViewCell: UITableViewCell {
    let profileImage = PosterImageView(frame: .zero)
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
    
    private func configureHierarchy() {
        contentView.addSubview(profileImage)
        contentView.addSubview(nameLabel)
        contentView.addSubview(roleLabel)
    }
    
    func configureViews(item: Cast) {
        profileImage.configureImage(poster: item.profile)
        nameLabel.text = item.name
        roleLabel.text = item.roles[0].character
    }
    
    private func configureConstraints() {
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
