//
//  TableSectionView.swift
//  CollapsibleTableView
//
//  Created by NikitaHassan on 26/09/19.
//  Copyright © 2019 NikitaHassan. All rights reserved.
//

import UIKit

class TableSectionView: UIView {

    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var headerImage: UIImageView!
    
    
    func updateHeader(info:Model){
        headerLabel.text = info.sectionTitle
        headerImage.image = UIImage.init(named: info.sectionImage)
    }
    
}
