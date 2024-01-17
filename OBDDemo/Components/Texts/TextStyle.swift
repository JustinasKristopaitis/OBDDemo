//
//  TextStyle.swift
//  OBDDemo
//
//  Created by Justinas Kristopaitis on 17/01/2024.
//

import SwiftUI

enum TextStyle {
    case title, description, small

    var style: Font {
        switch self {
        case .description:
            return .custom("SFProDisplay-Bold", size: 14)
        case .title:
            return .custom("SFProDisplay-Bold", size: 16)
        case .small:
            return .caption

        }
    }

    var color: Color {
        switch self {
        case .title:
            return .init(red: 255, green: 255, blue: 255)
        case .description:
            return .init(red: 255, green: 255, blue: 255, opacity: 0.7)
        case .small:
            return .black
        }
    }
}
