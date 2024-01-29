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
                    OBDLoadingView()
                        .frame(width: 120, height: 60)
                }
            )
            VStack {
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 4) {
                        if controlUnitData.status.lowercased() == "faulty" {
                            FaultyBadge()
                        }
                        HStack {
                            OBDText(
                                controlUnitData.name,
                                style: .title,
                                alignment: .leading
                            )
                        }
                        OBDText(
                            "ID \(controlUnitData.id)",
                            style: .description,
                            alignment: .leading
                        )

                    }
                    .padding(.leading, 16)

                    Spacer()
                    Image("right_arrow")
                }

                Divider()
                    .padding(.top, 15)
                    .padding(.leading, 16)
                    .foregroundColor(.primaryWhiteWithOpacity(alpha: 0.13))
            }
        }
        .frame(height: 92)
    }
}
