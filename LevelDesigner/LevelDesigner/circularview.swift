//
//  circularview.swift
//  LevelDesigner
//
//  Created by 杨青山 on 1/2/18.
//  Copyright © 2018 nus.cs3217.a0101010. All rights reserved.
//

import UIKit

class circularview: UIImageView {

    override func awakeFromNib() {
        layer.cornerRadius = frame.size.width/2
        layer.masksToBounds = true
    }
    

    

}
