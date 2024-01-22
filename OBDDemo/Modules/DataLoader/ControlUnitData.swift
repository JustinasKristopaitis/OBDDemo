//
//  ControlUnitData.swift
//  OBDDemo
//
//  Created by Justinas Kristopaitis on 21/01/2024.
//

import Foundation

struct ControlUnitData: Identifiable, Equatable {
    var id: String
    let name: String
    let status: String
    let `protocol`: String?
    let serialNumber: String
    let imageUrlString: String
}
