//
//  SelectViewController.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/8/24.
//

import UIKit

final class SelectViewController: UIViewController {
    let selectView = SelectView()
    
    var list: [ImageModel] = []
    var space: ((String) -> Void)?
    
    override func loadView() {
        view = selectView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        selectView.collectionView.delegate = self
        selectView.collectionView.dataSource = self
        selectView.collectionView.register(SearchCollectionViewCell.self, forCellWithReuseIdentifier: "select")
        UnsplashAPIManager.shared.fetchToPhotos { result in
            self.list = result
            self.selectView.collectionView.reloadData()
        }
    }
}

extension SelectViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return list.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "select", for: indexPath) as! SearchCollectionViewCell
        cell.configureView(url: list[indexPath.item].urls.regular)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        space?(list[indexPath.item].urls.regular)
        dismiss(animated: true)
    }
}
