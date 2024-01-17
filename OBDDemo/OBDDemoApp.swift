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
            ControlUnitsListView()
                .background(Color(red: 17/255, green: 17/255, blue: 17/255, opacity: 1))

        }
    }
}
