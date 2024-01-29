//
//  ControlUnitsListViewModel.swift
//  OBDDemo
//
//  Created by Justinas Kristopaitis on 21/01/2024.
//

import Foundation

class ControlUnitsListViewModel: ObservableObject {
    enum ControlUnitsLoadingState {
        case loading, empty, success, failed
    }
    var state: ControlUnitsLoadingState = .loading
    private let vehicleDataLoader: VehicleDataLoading

    @Published var data: [ControlUnitData] = []

    init(
        vehicleDataLoader: VehicleDataLoading
    ) {
        self.vehicleDataLoader = vehicleDataLoader
    }

    @MainActor
    func loadVehicleData() async {
        do {
            state = .loading
            data = try await vehicleDataLoader.loadData(forceLoad: true)
            if data.isEmpty {
                state = .empty
            } else {
                state = .success
            }
        } catch {
            state = .failed
        }
    }
}
