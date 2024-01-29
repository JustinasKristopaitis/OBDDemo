//
//  ErrorView.swift
//  OBDDemo
//
//  Created by Justinas Kristopaitis on 28/01/2024.
//

import SwiftUI

typealias CompletionHandler = (()-> Void)

struct ErrorView: View {
    let title: String
    let message: String
    let buttonCTA: String?
    let imageName: String?
    let onButtonTap: CompletionHandler?

    init(
        title: String,
        message: String,
        buttonCTA: String?,
        imageName: String?,
        onButtonTap: CompletionHandler?
    ) {
        self.title = title
        self.message = message
        self.buttonCTA = buttonCTA
        self.imageName = imageName
        self.onButtonTap = onButtonTap
    }
    var body: some View {
        VStack(spacing: 16) {
            if let imageName {
                Image(imageName)
            }
            VStack(spacing: 4) {
                OBDText(title, style: .title)
                OBDText(message, style: .description)
            }
            if let buttonCTA {
                Button(buttonCTA) {
                    onButtonTap?()
                }
            }
        }
    }
}

#Preview {
    ErrorView(
        title: "Lorem",
        message: "Lorem impsum",
        buttonCTA: "CTA Button",
        imageName: "ecu",
        onButtonTap: nil
    )
}
