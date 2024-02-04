//
//  VehicleDataLoader.swift
//  OBDDemo
//
//  Created by Justinas Kristopaitis on 21/01/2024.
//

import VehicleAPI
import Foundation

protocol VehicleDataLoading {
    func loadData() async throws -> [ControlUnitData]
}

class VehicleDataLoader: VehicleDataLoading {
    private let service: ControlUnitServiceInterface

    init(
        service: ControlUnitServiceInterface = VehicleAPI.Factory.controlUnitService
    ) {
        self.service = service
    }

    func loadData() async throws -> [ControlUnitData] {
        let controlUnits = try await service.controlUnits()
        return controlUnits.map { $0.convertToControlUnitData() }
    }
}

extension ControlUnit {
    func convertToControlUnitData() -> ControlUnitData {
        ControlUnitData(
            id: id,
            name: name,
            status: status,
            protocol: `protocol`,
            serialNumber: serialNumber,
            imageUrlString: imageUrlString
        )
    }
}
