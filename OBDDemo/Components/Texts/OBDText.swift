//
//  OBDText.swift
//  OBDDemo
//
//  Created by Justinas Kristopaitis on 17/01/2024.
//

import SwiftUI

struct OBDText: View {
    let text: String
    let style: TextStyle
    let alignment: Alignment

    init(
        _ text: String,
        style: TextStyle = .description,
        alignment: Alignment = .center
    ) {
        self.text = text
        self.style = style
        self.alignment = alignment
    }

    var body: some View {
        Text(text)
            .font(style.font)
            .foregroundStyle(style.color)
            .frame(maxWidth: .infinity, alignment: alignment)
    }
}
