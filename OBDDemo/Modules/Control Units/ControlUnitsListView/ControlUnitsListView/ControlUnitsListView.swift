//
//  ControlUnitsListView.swift
//  OBDDemo
//
//  Created by Justinas Kristopaitis on 18/01/2024.
//

import SwiftUI

struct ControlUnitsListView: View {
    @ObservedObject private var viewModel: ControlUnitsListViewModel

    init(
        viewModel: ControlUnitsListViewModel
    ) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            OBDText("Control Units", style: .titleL)

            List {
                ForEach(viewModel.data) { item in
                    ControlUnitEntryView(controlUnitData: item)
                        .listRowBackground(Color.primaryBackground)
                }
            }
            .listStyle(.plain)
            .background(Color.primaryBackground)

            .onAppear {
                Task {
                    try await viewModel.loadVehicleData()
                }
            }
        }
        .padding(.horizontal, 16)
        .background(Color.primaryBackground)

    }
}
