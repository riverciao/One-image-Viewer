//
//  Photo.swift
//  One-image Viewer
//
//  Created by riverciao on 2017/11/23.
//  Copyright © 2017年 riverciao. All rights reserved.
//

import UIKit

enum Photo {
    case baseball
//    case blue
//    case danger
//    case lakeHouse
//    case lovelyRoadSide
//    case parkingSide
//    case ramen
//    case ramenEmpty
//    case roadSide
//    case sakura
    static var count: Int { return self.baseball.hashValue + 1}
}

extension Photo {
    var photoImage: UIImage? {
        switch self {
        case .baseball:
            if let baseballImage = UIImage(named: "img_baseball") {
                return baseballImage
            } else {
                return nil
            }
        }
    }
}
