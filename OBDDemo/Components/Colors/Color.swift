//
//  Color.swift
//  OBDDemo
//
//  Created by Justinas Kristopaitis on 21/01/2024.
//

import SwiftUI

/*
 Talk to designers. Would be great to have color names in Figma. Even for testing (just to see that candidates notice that. Same for Buttons, Text etc.
 */
extension Color {
    static let primaryWhite: Color = Color(red: 1, green: 1, blue: 1)
    static func primaryWhiteWithOpacity(alpha: Double = 0.7) -> Color { Color(red: 1, green: 1, blue: 1, opacity: alpha) }
    static let primaryBackground: Color = Color(red: 0.07, green: 0.07, blue: 0.07)
    static let primaryBlue: Color = Color(red: 0.36, green: 0.62, blue: 1)
    static let primaryRed: Color = Color(red: 1, green: 0.38, blue: 0.38)



}
