//
//  DetailSection.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/4/24.
//

import Foundation

enum DetailSection: CaseIterable {
    case overview
    case cast
    
    static var castList: [Cast] = []
    
    var sectionHeaderTitle: String {
        switch self {
        case .overview: "Overview"
        case .cast: "Cast"
        }
    }
    
    var numberOfRows: Int {
        switch self {
        case .overview: 1
        case .cast: DetailSection.castList.count
        }
    }
}
