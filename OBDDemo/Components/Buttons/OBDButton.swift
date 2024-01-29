//
//  OBDButton.swift
//  OBDDemo
//
//  Created by Justinas Kristopaitis on 28/01/2024.
//

import SwiftUI

struct OBDButton: View {
    let text: String

    init(
        _ text: String
    ) {
        self.text = text
    }

    var body: some View {
        Text(text)
//            .font(style.font)
//            .foregroundStyle(style.color)
    }
}
