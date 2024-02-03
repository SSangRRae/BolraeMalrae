//
//  TrendingHeaderView.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/2/24.
//

import UIKit
import SnapKit

class TrendingHeaderView: UIView {
    let button: UIButton = {
        let view = UIButton()
        view.setTitle("트렌드 따라갈래 >", for: .normal)
        view.setTitleColor(.black, for: .normal)
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
        addSubview(button)
    }
    
    func configureConstraints() {
        button.snp.makeConstraints { make in
            make.leading.equalTo(safeAreaLayoutGuide).offset(16)
        }
    }
}
