//
//  Model.swift
//  CollapsibleTableView
//
//  Created by NikitaHassan on 25/09/19.
//  Copyright © 2019 NikitaHassan. All rights reserved.
//

import UIKit

class Model: NSObject {
    
    var sectionImage:String!
    var sectionTitle:String!
    var isExpanded:Bool!
    var dataArr = [String]()
    
    init(image:String,expanded:Bool,data:[String],title:String) {
        self.sectionImage = image
        self.isExpanded = expanded
        self.dataArr = data
        self.sectionTitle = title
    }

}
