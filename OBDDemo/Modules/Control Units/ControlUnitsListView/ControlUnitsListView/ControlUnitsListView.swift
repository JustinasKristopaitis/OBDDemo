//
//  ControlUnitsListView.swift
//  OBDDemo
//
//  Created by Justinas Kristopaitis on 18/01/2024.
//

import SwiftUI

struct ControlUnitsListView: View {
    @ObservedObject private var viewModel: ControlUnitsListViewModel
    @State private var searchText = ""
    @State private var isSearching = false

    init(viewModel: ControlUnitsListViewModel) {
        self.viewModel = viewModel
    }

    var body: some View {
        VStack {
            HeaderView
            .padding(.trailing, 16)

            Spacer()
            switch viewModel.state {
            case .loading:
                OBDLoadingView()
            case .empty:
                EmptyView
            case .success:
                ControlUnitsView(data: viewModel.data)
            case .failed:
                LoadingFailedView
            case .searching:
                if searchText.isEmpty || !viewModel.searchedData.isEmpty {
                    ControlUnitsView(data: viewModel.searchedData)
                } else {
                    /*
                     Ask design to unify error view title, body text heights. (or at least for HW task :) )
                     Or this is not an "Error View", but this would be a good to talk during some refinements :)
                     But in general, more reusable components -> the easier it is for us in the future.
                     */
                    ErrorView(title: "No Results", message: "Try searching again.")
                }
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
    }

    @ViewBuilder
    private func ControlUnitsView(data: [ControlUnitData]) -> some View {
        ScrollView {
            ForEach(data) { item in
                ControlUnitEntryView(controlUnitData: item)
                    .frame(height: 92)
            }
        }
        .padding(.horizontal, 16)
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
            imageName: nil
        ) {
            Task {
                await viewModel.loadVehicleData()
            }
        }
    }

    @ViewBuilder
    private var HeaderView: some View {
        if viewModel.state == .success || viewModel.state == .searching {
            HeaderSearchView
                .frame(height: 60)
        } else {
            OBDText("Control Units", style: .titleL)
                .frame(height: 60)
        }
    }

    @ViewBuilder
    private var HeaderSearchView: some View {
        HStack {
            if isSearching {
                SearchView(searchText: $searchText) { value in
                    viewModel.search(text: value)
                }
                .padding(.leading, 16)

                Button("Cancel") {
                    searchText = ""
                    isSearching = false
                    viewModel.resetSearch()
                }
                .foregroundColor(.white)
                .padding(.leading, 10)
            } else {
                OBDText("Control Units", style: .titleL)
                    .frame(maxWidth: .infinity, alignment: .center)

                Button(action: {
                    isSearching = true
                }) {
                    Image("search_outline")
                        .padding(.trailing, 10)
                }
            }
        }
    }
}
