//
//  ControlUnitsListViewModel.swift
//  OBDDemo
//
//  Created by Justinas Kristopaitis on 21/01/2024.
//

import Foundation

class ControlUnitsListViewModel: ObservableObject {
    enum ControlUnitsLoadingState {
        case loading, empty, success, failed, searching
    }

    var state: ControlUnitsLoadingState = .loading

    @Published var data: [ControlUnitData] = []
    @Published var searchedData: [ControlUnitData] = []

    private let vehicleDataLoader: VehicleDataLoading
    private let searchable: DataSearcher<ControlUnitData>

    init(
        vehicleDataLoader: VehicleDataLoading,
        searchable: DataSearcher<ControlUnitData>
    ) {
        self.vehicleDataLoader = vehicleDataLoader
        self.searchable = searchable
    }

    @MainActor
    func loadVehicleData() async {
        do {
            state = .loading
            data = try await vehicleDataLoader.loadData()
            if data.isEmpty {
                state = .empty
            } else {
                state = .success
            }
        } catch {
            state = .failed
        }
    }

    func search(text: String) {
        state = .searching
        searchedData = searchable.filterArray(of: data, with: text)
    }

    func resetSearch() {
        state = .success
        searchedData = []
    }
}
