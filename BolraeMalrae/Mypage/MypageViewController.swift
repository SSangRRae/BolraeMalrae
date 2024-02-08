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
        vc.space = { profileImage, nickname in
            if profileImage == "person" {
                self.mypageView.profileImage.image = UIImage(systemName: profileImage)
            } else {
                let url = URL(string: profileImage)
                self.mypageView.profileImage.kf.setImage(with: url)
            }
            if nickname.isEmpty {
                self.mypageView.nicknameLabel.text = "미정"
            } else {
                self.mypageView.nicknameLabel.text = nickname
            }
            
        }
        navigationController?.pushViewController(vc, animated: true)
    }
}
