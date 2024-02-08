//
//  SelectView.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/8/24.
//

import UIKit

class SelectView: UIView {
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: configureCollectionViewLayout())
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.directionalEdges.equalTo(safeAreaLayoutGuide)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func configureCollectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let space: CGFloat = 8
        let deviceWidth = UIScreen.main.bounds.width
        let cellWidth = deviceWidth - (space * 4)
        
        layout.itemSize = CGSize(width: cellWidth/3, height: cellWidth/3)
        layout.sectionInset = UIEdgeInsets(top: space, left: space, bottom: space, right: space)
        layout.minimumLineSpacing = space
        layout.minimumInteritemSpacing = space
        
        return layout
    }
}
