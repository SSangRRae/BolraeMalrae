//
//  DetailSection.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/4/24.
//

import Foundation

enum DetailSection: CaseIterable {
    case image
    case overview
    case cast
    
    static var castList: [Cast] = []
    
    var sectionHeaderTitle: String? {
        switch self {
        case .image: nil
        case .overview: "Overview"
        case .cast: "Cast"
        }
    }
    
    var numberOfRows: Int {
        switch self {
        case .image, .overview: 1
        case .cast: DetailSection.castList.count
        }
    }
}
