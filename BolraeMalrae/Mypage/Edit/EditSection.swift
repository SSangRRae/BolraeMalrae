//
//  EditSection.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/8/24.
//

import Foundation

enum EditSection: CaseIterable {
    case profileImage
    case profile
    
    static let profileList = ["이름", "닉네임", "소개"]
    
    var numberOfRows: Int {
        switch self {
        case .profileImage: 1
        case .profile: EditSection.profileList.count
        }
    }
}
