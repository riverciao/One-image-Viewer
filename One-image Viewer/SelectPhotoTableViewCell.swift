//
//  SelectPhotoTableViewCell.swift
//  One-image Viewer
//
//  Created by riverciao on 2017/11/23.
//  Copyright © 2017年 riverciao. All rights reserved.
//

import UIKit

//var cellPhotoImageView: UIImageView!


class SelectPhotoTableViewCell: UITableViewCell {

    @IBOutlet weak var cellPhotoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
