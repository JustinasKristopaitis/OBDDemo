//
//  SearchView.swift
//  OBDDemo
//
//  Created by Justinas Kristopaitis on 04/02/2024.
//

import SwiftUI

struct SearchView: View {
    @Binding var searchText: String
    var onValueChange: ((String) -> Void)?

    var body: some View {
        HStack {
            Image("search_outline")
                .padding(.leading, 10)

            TextField("Search", text: $searchText)
                .foregroundStyle(Color.primaryWhiteWithOpacity(alpha: 0.7))
                .padding(.vertical, 8)
                .onChange(of: searchText) {
                    onValueChange?(searchText)
                }

            Button(action: {
                searchText = ""
            }) {
                Image(systemName: "xmark.circle.fill")
                    .foregroundColor(.gray)
                    .padding(.trailing, 8)
            }
        }
        .background(Color.primaryWhiteWithOpacity(alpha: 0.08))
        .cornerRadius(9)
        .padding(.trailing, 8)
        .padding(.vertical, 11)
    }
}
