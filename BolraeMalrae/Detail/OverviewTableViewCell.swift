//
//  OverviewTableViewCell.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/4/24.
//

import UIKit

final class OverviewTableViewCell: UITableViewCell {
    let textView: UILabel = {
        let view = UILabel()
        view.numberOfLines = 0
        view.textColor = .black
        view.font = .systemFont(ofSize: 15)
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
        contentView.addSubview(textView)
    }
    
    private func configureConstraints() {
        textView.snp.makeConstraints { make in
            make.edges.equalTo(contentView).inset(24)
        }
    }
}
