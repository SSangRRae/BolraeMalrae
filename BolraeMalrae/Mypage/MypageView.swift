//
//  MypageView.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/8/24.
//

import UIKit

final class MypageView: UIView {
    let profileImage = UIImageView()
    let nicknameLabel: UILabel = {
        let view = UILabel()
        view.text = "닉네임"
        view.textColor = .black
        view.textAlignment = .center
        view.font = .systemFont(ofSize: 16)
        return view
    }()
    let editButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        view.tintColor = .black
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = .white
        configureHierarchy()
        configureView()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureHierarchy() {
        addSubview(profileImage)
        addSubview(nicknameLabel)
        addSubview(editButton)
    }
    
    private func configureView() {
        profileImage.image = UIImage(systemName: "person")
        profileImage.clipsToBounds = true
        DispatchQueue.main.async {
            self.profileImage.layer.cornerRadius = self.profileImage.frame.width / 2
        }
    }
    
    private func configureConstraints() {
        profileImage.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide).offset(8)
            make.centerX.equalTo(self)
            make.size.equalTo(80)
        }
        nicknameLabel.snp.makeConstraints { make in
            make.centerX.equalTo(self)
            make.top.equalTo(profileImage.snp.bottom).offset(8)
            make.height.equalTo(22)
        }
        editButton.snp.makeConstraints { make in
            make.centerY.equalTo(nicknameLabel.snp.centerY)
            make.leading.equalTo(nicknameLabel.snp.trailing).offset(8)
            make.size.equalTo(44)
        }
    }
}
