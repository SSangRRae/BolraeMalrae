//
//  MypageViewController.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/2/24.
//

import UIKit

class MypageViewController: UIViewController {
    let mypageView = MypageView()
    
    override func loadView() {
        self.view = mypageView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mypageView.editButton.addTarget(self, action: #selector(editButtonClicked), for: .touchUpInside)
    }
    
    @objc func editButtonClicked() {
        let vc = EditViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}
