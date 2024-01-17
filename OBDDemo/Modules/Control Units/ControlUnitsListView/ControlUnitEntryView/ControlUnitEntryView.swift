//
//  ControlUnitEntryView.swift
//  OBDDemo
//
//  Created by Justinas Kristopaitis on 18/01/2024.
//

import SwiftUI

struct ControlUnitEntryView: View {
    let imageUrl: URL?

    init(imageUrl: URL?) {
        self.imageUrl = imageUrl
    }
    var body: some View {
        HStack {
            AsyncImage(
                url: imageUrl,
                content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 120, height: 60)
                },
                placeholder: {
                    ProgressView()
                }
            )
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    OBDText("Title text", style: .title, alignment: .leading)
                    OBDText("Description Text", style: .description, alignment: .leading)

                }
                .padding(.horizontal, 16)

                Image("right_arrow")
            }
            Divider()
                .background(Color.white)
        }
    }
}

#Preview {
    ControlUnitEntryView(imageUrl: nil)
}
