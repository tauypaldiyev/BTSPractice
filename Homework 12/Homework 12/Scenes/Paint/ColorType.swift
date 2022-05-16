//
//  ColorType.swift
//  Homework 12
//
//  Created by Rauan Maksatuly on 15.05.2022.
//

import Foundation
import UIKit

enum ColorType: Int {
    case red = 0, green, blue
    
    var color: UIColor {
        switch self {
        case .red:
            return .red
        case .green:
            return .green
        case .blue:
            return .blue
        }
    }
}
