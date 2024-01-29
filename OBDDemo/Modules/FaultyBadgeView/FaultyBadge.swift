//
//  FaultyBadge.swift
//  OBDDemo
//
//  Created by Justinas Kristopaitis on 28/01/2024.
//

import SwiftUI

struct FaultyBadge: View {
    var body: some View {
        VStack(alignment: .leading) {
            OBDText("Faulty", style: .small)
                .padding(.horizontal, 4)
                .padding(.vertical, 2)
                .background(Color.primaryRed)
                .cornerRadius(2)
        }
    }
}

#Preview {
    FaultyBadge()
}
