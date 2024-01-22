//
//  ControlUnitEntryView.swift
//  OBDDemo
//
//  Created by Justinas Kristopaitis on 18/01/2024.
//

import SwiftUI

struct ControlUnitEntryView: View {
    private let controlUnitData: ControlUnitData

    init(controlUnitData: ControlUnitData) {
        self.controlUnitData = controlUnitData
    }
    var body: some View {
        HStack {
            AsyncImage(
                url: URL(string: controlUnitData.imageUrlString),
                content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 120, height: 60)
                        .cornerRadius(4)
                        .border(Color(red: 1, green: 1, blue: 1, opacity: 0.1), width: 1)

                },
                placeholder: {
                    ProgressView()
                }
            )
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    OBDText(controlUnitData.name, style: .title, alignment: .leading)
                    OBDText("ID \(controlUnitData.id)", style: .description, alignment: .leading)

                }
                .padding(.horizontal, 16)

                Image("right_arrow")
            }
        }
    }
}
