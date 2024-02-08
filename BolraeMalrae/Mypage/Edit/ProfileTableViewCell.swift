//
//  ProfileTableViewCell.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/8/24.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    let titleLabel: UILabel = {
        let view = UILabel()
        view.textColor = .black
        view.font = .systemFont(ofSize: 15)
        return view
    }()
    let inputTextField: UITextField = {
        let view = UITextField()
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
        contentView.addSubview(titleLabel)
        contentView.addSubview(inputTextField)
    }
    
    func configureViews(title: String) {
        titleLabel.text = title
        inputTextField.placeholder = "\(title)를 입력해주세요"
    }
    
    func configureConstraints() {
        titleLabel.snp.makeConstraints { make in
            make.leading.verticalEdges.equalTo(contentView).inset(16)
            make.height.equalTo(22)
            make.width.equalTo(50)
        }
        inputTextField.snp.makeConstraints { make in
            make.centerY.equalTo(titleLabel.snp.centerY)
            make.leading.equalTo(titleLabel.snp.trailing).offset(16)
            make.height.equalTo(22)
            make.trailing.equalTo(contentView.snp.trailing).inset(16)
        }
    }
}
