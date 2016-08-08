//
//  WTKCollectionViewCell.swift
//  WTKNews
//
//  Created by 王同科 on 16/8/8.
//  Copyright © 2016年 王同科. All rights reserved.
//

import UIKit

class WTKCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var tableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        print("创建cell了")
    }

}
