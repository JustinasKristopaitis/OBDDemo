//
//  OBDDemoApp.swift
//  OBDDemo
//
//  Created by Justinas Kristopaitis on 17/01/2024.
//

import SwiftUI

@main
struct OBDDemoApp: App {
    var body: some Scene {
        WindowGroup {
            ControlUnitsListView(
                viewModel: ControlUnitsListViewModel(
                    vehicleDataLoader: VehicleDataLoader()
                )
            )
            .background(Color.primaryBackground)
        }
    }
}
