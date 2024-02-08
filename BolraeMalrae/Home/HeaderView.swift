//
//  TrendingHeaderView.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/2/24.
//

import UIKit
import SnapKit

final class HeaderView: UIView {
    final let leftButton: UIButton = {
        let view = UIButton()
        view.setTitleColor(.systemGray, for: .normal)
        view.titleLabel?.font = .boldSystemFont(ofSize: 20)
        return view
    }()
    final let rightButton: UIButton = {
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
    
    private func configureHierarchy() {
        addSubview(leftButton)
        addSubview(rightButton)
    }
    
    private func configureConstraints() {
        leftButton.snp.makeConstraints { make in
            make.verticalEdges.equalTo(self)
            make.leading.equalTo(self).offset(16)
            make.height.equalTo(22)
        }
        rightButton.snp.makeConstraints { make in
            make.trailing.equalTo(self).offset(-16)
            make.height.equalTo(22)
        }
    }
}
