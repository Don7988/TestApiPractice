//
//  ViewModel.swift
//  APIPractice
//
//  Created by Don Dominic on 24/07/23.
//

import UIKit
enum HomeCellTypes{
    case homeCell
}

class ViewModel: NSObject {
    var identifier : String = "home.tableView.cell"
    var dataModel: DataModel = DataModel([:])
    var homeCellType: HomeCellTypes = .homeCell
    var dataIndex = -1
    
    init(cellType: HomeCellTypes) {
        self.homeCellType = cellType
        switch cellType {
        case .homeCell:
            identifier = "home.tableView.cell"
        }
    }
}

