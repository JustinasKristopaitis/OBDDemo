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
            Spacer()
            switch viewModel.state {
            case .loading:
                OBDLoadingView()
            case .empty:
                EmptyView
            case .success:
                ControlUnitsView
            case .failed:
                LoadingFailedView
            }
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .onAppear {
            Task {
                await viewModel.loadVehicleData()
            }
        }
        .background(Color.primaryBackground)
        .refreshable {
            Task {
                await viewModel.loadVehicleData()
            }
        }

    }

    @ViewBuilder
    private var ControlUnitsView: some View {
        List {
            ForEach(viewModel.data) { item in
                ControlUnitEntryView(controlUnitData: item)
                    .frame(height: 92)
                    .listRowBackground(Color.primaryBackground)
                    .listRowSeparator(.hidden)
            }
        }
        .listStyle(.plain)
        .background(Color.primaryBackground)
    }

    @ViewBuilder
    private var EmptyView: some View {
        ErrorView(
            title: "Control Unit List is Empty",
            message: "Vehicle contains no control units.",
            buttonCTA: nil,
            imageName: "ecu",
            onButtonTap: nil
        )
    }

    @ViewBuilder
    private var LoadingFailedView: some View {
        ErrorView(
            title: "Unable to Load Control Unit List",
            message: "Please try again later.",
            buttonCTA: "Try Again",
            imageName: nil) {
                Task {
                    await viewModel.loadVehicleData()
                }
            }
    }
}
