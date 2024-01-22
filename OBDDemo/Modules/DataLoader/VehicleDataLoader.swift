//
//  VehicleDataLoader.swift
//  OBDDemo
//
//  Created by Justinas Kristopaitis on 21/01/2024.
//

import VehicleAPI
import Foundation

protocol VehicleDataLoading {
    func loadData(forceLoad: Bool) async throws -> [ControlUnitData]
    func faultCaunt(forId id: String) -> Int
}

class VehicleDataLoader: VehicleDataLoading {
    private let service: ControlUnitServiceInterface
    private var cachedData: [ControlUnitData]?

    init(
        service: ControlUnitServiceInterface = VehicleAPI.Factory.controlUnitService
    ) {
        self.service = service
    }
    func loadData(forceLoad: Bool) async throws -> [ControlUnitData] {
        if !forceLoad, let cachedData = cachedData {
            return cachedData
        } else {
            do {
                let controlUnits = try await service.controlUnits()
                let data = controlUnits.map { $0.convertToControlUnitData() }
                cachedData = data
                return data
            } catch {
                throw error
            }
        }
    }

    func faultCaunt(forId id: String) -> Int {
        service.faultCount(controlUnitId: id)
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
