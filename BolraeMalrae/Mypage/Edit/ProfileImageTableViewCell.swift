//
//  ProfileImageTableViewCell.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/8/24.
//

import UIKit

class ProfileImageTableViewCell: UITableViewCell {
    let profileImage = UIImageView()
    let button: UIButton = {
        let view = UIButton()
        view.setTitle("프로필 이미지 수정", for: .normal)
        view.setTitleColor(.systemGray, for: .normal)
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureHierarchy()
        configureViews()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureHierarchy() {
        contentView.addSubview(profileImage)
        contentView.addSubview(button)
    }
    
    func configureViews() {
        profileImage.backgroundColor = .gray
    }
    
    func configureConstraints() {
        profileImage.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(8)
            make.centerX.equalTo(contentView)
            make.size.equalTo(80)
        }
        button.snp.makeConstraints { make in
            make.centerX.equalTo(contentView)
            make.top.equalTo(profileImage.snp.bottom).offset(8)
            make.height.equalTo(22)
            make.bottom.equalTo(contentView.snp.bottom).inset(8)
        }
    }
}
