//
//  TextStyle.swift
//  OBDDemo
//
//  Created by Justinas Kristopaitis on 17/01/2024.
//

import SwiftUI

enum TextStyle {
    case title, description, titleL, small

    var font: Font {
        switch self {
        case .description:
            return Font.custom("SF Pro", size: 14)
        case .title:
            return Font.custom("SF Pro", size: 16)
        case .titleL:
            return Font.custom("SF Pro", size: 18)
        case .small:
            return Font.custom("SF Pro", size: 10)

        }
    }

    var color: Color {
        switch self {
        case .title, .titleL:
            return .primaryWhite
        case .description:
            return .primaryWhiteWithOpacity()
        case .small:
            return .black
        }
    }
}
