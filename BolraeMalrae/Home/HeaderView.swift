//
//  TrendingHeaderView.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/2/24.
//

import UIKit
import SnapKit

class HeaderView: UIView {
    let leftButton: UIButton = {
        let view = UIButton()
        view.setTitleColor(.systemGray, for: .normal)
        view.titleLabel?.font = .boldSystemFont(ofSize: 20)
        return view
    }()
    let rightButton: UIButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        view.tintColor = .systemGray
        view.titleLabel?.font = .boldSystemFont(ofSize: 20)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureHierarchy()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("TendingHeaderView Required Init Error")
    }
    
    func configureHierarchy() {
        addSubview(leftButton)
        addSubview(rightButton)
    }
    
    func configureConstraints() {
        leftButton.snp.makeConstraints { make in
            make.leading.equalTo(safeAreaLayoutGuide).offset(16)
            make.height.equalTo(33)
        }
        rightButton.snp.makeConstraints { make in
            make.trailing.equalTo(safeAreaLayoutGuide).offset(-16)
            make.height.equalTo(33)
        }
    }
}
