//
//  EditViewController.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/8/24.
//

import UIKit

class EditViewController: UIViewController {
    let editView = EditView()
    
    override func loadView() {
        view = editView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        editView.tableView.delegate = self
        editView.tableView.dataSource = self
        editView.tableView.separatorStyle = .none
        editView.tableView.register(ProfileImageTableViewCell.self, forCellReuseIdentifier: "profileImage")
        editView.tableView.register(ProfileTableViewCell.self, forCellReuseIdentifier: "profile")
        designNavigation()
    }
}

extension EditViewController {
    func designNavigation() {
        navigationItem.title = "프로필 편집"
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "취소", style: .plain, target: self, action: #selector(cancelButtonClicked))
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(completeButtonClicked))
    }
    
    @objc func cancelButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func completeButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
    
    @objc func profileImageEditButtonClicked() {
        
    }
}

extension EditViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return EditSection.allCases.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EditSection.allCases[section].numberOfRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "profileImage", for: indexPath) as! ProfileImageTableViewCell
            cell.button.addTarget(self, action: #selector(profileImageEditButtonClicked), for: .touchUpInside)
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "profile", for: indexPath) as! ProfileTableViewCell
            cell.configureViews(title: EditSection.profileList[indexPath.row])
            return cell
        }
        
    }
}
