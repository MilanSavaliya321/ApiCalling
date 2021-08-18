//
//  ApiCell.swift
//  ApiCalling
//
//  Created by Kartum Infotech on 17/08/21.
//  Copyright © 2021 Kartum Infotech. All rights reserved.
//

import UIKit

class ApiCell: UITableViewCell {
    
    //MARK:- IBOutlets
    @IBOutlet weak var lblTitle: UILabel!
    
    //MARK:- LifeCycles
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    //MARK:- Functions
    func config(index: ApiType) {
        lblTitle.text = index.rawValue
    }
    
}
