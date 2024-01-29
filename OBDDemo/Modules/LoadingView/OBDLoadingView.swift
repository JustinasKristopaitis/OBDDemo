//
//  OBDLoadingView.swift
//  OBDDemo
//
//  Created by Justinas Kristopaitis on 28/01/2024.
//

import SwiftUI

struct OBDLoadingView: View {
    @State private var isLoading = false

    private let description: String?

    init(description: String? = nil) {
        self.description = description
    }

    /* In Figma I see that on loading "Indicator" is an image. Not animating loading, is not loading :D In such a case, I would go to talk to designers, but as I can't... I improvised a bit.

     Also, I am not sure about the size. Image size is 96x96, but image has paddings, so again, would need to talk to designers.
     */

    var body: some View {
        VStack {
            Circle()
                .trim(from: 0, to: isLoading ? 1 : 0)
                .stroke(Color.primaryBlue, lineWidth: 2)
                .frame(width: 50, height: 50)
                .rotationEffect(.degrees(-90))
                .onAppear {
                    withAnimation(
                        Animation.easeInOut(
                            duration: 1.2
                        )
                        .repeatForever(
                            autoreverses: false
                        )
                    ) {
                        self.isLoading = true
                    }
                }

            if let description { // this wasn't in the designs, but I think it always makes sense to inform user what is happening, or FE add text, when loading took longer then expected, or explain how long the loading (scanning) might take.
                Text(description)
                    .padding(.top, 10)
            }
        }
    }
}

#Preview {
    OBDLoadingView()
}
