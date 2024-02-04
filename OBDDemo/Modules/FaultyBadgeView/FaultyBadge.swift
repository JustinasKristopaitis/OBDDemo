//
//  FaultyBadge.swift
//  OBDDemo
//
//  Created by Justinas Kristopaitis on 28/01/2024.
//

import SwiftUI

// Maybe should rename to some InfoBadge and inject text string, as well as color or other parameters?
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
