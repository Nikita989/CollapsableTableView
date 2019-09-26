//
//  TableViewCell.swift
//  CollapsibleTableView
//
//  Created by NikitaHassan on 25/09/19.
//  Copyright © 2019 NikitaHassan. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet weak var descLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func updateCell(text:String){
        self.descLabel.text = text
    }
    
}
