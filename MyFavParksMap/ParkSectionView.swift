//
//  ParkSectionView.swift
//  MyFavParksMap
//
//  Created by Bhumik Tandon on 3/18/25.
//
//BT
//Just wanted to mention you can swipe right to left to delete


import SwiftUI

struct ParkSectionView: View {
    let key: String
    let parks: [Park]
    @ObservedObject var vm: ParkVM
    
    var body: some View {
        Section(header: Text(key)) {
            ForEach(parks) { park in
                NavigationLink(destination: PDetailView(park: park)) {
                    ParkRow(park: park)
                }
            }
            .onDelete { idxSet in
                if let idx = idxSet.first, idx >= 0, idx < parks.count {
                    let doomed = parks[idx]
                    if let realIdx = vm.items.firstIndex(of: doomed) {
                        vm.items.remove(at: realIdx)
                    }
                }
            }
        }
    }
}
