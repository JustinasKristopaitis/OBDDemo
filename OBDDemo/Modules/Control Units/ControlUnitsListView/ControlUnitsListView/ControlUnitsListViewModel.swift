//
//  ControlUnitsListViewModel.swift
//  OBDDemo
//
//  Created by Justinas Kristopaitis on 21/01/2024.
//

import Foundation

class ControlUnitsListViewModel: ObservableObject {
    private let vehicleDataLoader: VehicleDataLoading

    @Published var data: [ControlUnitData] = []

    init(
        vehicleDataLoader: VehicleDataLoading
    ) {
        self.vehicleDataLoader = vehicleDataLoader
    }

    @MainActor
    func loadVehicleData() async throws {
        data = try await vehicleDataLoader.loadData(forceLoad: true)
    }
}
