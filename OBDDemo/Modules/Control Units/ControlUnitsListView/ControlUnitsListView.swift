//
//  ControlUnitsListView.swift
//  OBDDemo
//
//  Created by Justinas Kristopaitis on 18/01/2024.
//

import SwiftUI

struct ControlUnitsListView: View {
    var body: some View {
        OBDText("Text here", style: .title)
        ControlUnitEntryView(imageUrl: nil)
    }
}

#Preview {
    ControlUnitsListView()
}
