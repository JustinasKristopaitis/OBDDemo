//
//  Searchable.swift
//  OBDDemo
//
//  Created by Justinas Kristopaitis on 04/02/2024.
//

import Foundation

protocol Searchable {
    associatedtype DataType

    func filterArray(of data: [DataType], with searchText: String) -> [DataType]

    // not doing this screen, as lack of time, but just... for future development :D
    func sortArray(of data: [DataType], by keyPath: KeyPath<DataType, String>) -> [DataType]
}

struct DataSearcher<Item>: Searchable {
    func filterArray(of data: [Item], with searchText: String) -> [Item] {
        guard !searchText.isEmpty else {
            return data
        }

        return data.filter { item in
            return "\(item)".localizedCaseInsensitiveContains(searchText)
        }
    }

    // not doing this screen, as lack of time, but just... for future development :D
    func sortArray(of data: [Item], by keyPath: KeyPath<Item, String>) -> [Item] {
        data.sorted(by: { $0[keyPath: keyPath] < $1[keyPath: keyPath] })
    }
}
