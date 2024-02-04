//
//  HomeSection.swift
//  BolraeMalrae
//
//  Created by SangRae Kim on 2/3/24.
//

import Foundation

enum HomeSection: CaseIterable {
    case trending
    case topRated
    case popular
    
    static var allTrendingList: [TV] = []
    static var list: [[TV]] = [[], [], []]
    
    var heightRow: CGFloat {
        switch self {
        case .trending: 60
        case .topRated, .popular: 250
        }
    }
    
    var sectionHeaderTitle: String {
        switch self {
        case .trending: "트렌드 따라갈래"
        case .topRated: "평점 줄래"
        case .popular: "인기 있네"
        }
    }
    
    var numberOfRows: Int {
        switch self {
        case .trending: HomeSection.list[0].count
        case .topRated, .popular: 1
        }
    }
    
    static func top5Trending() {
        for i in 0...4 {
            HomeSection.list[0].append(HomeSection.allTrendingList[i])
        }
    }
}
