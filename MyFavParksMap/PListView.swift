//
//  PListView.swift
//  MyFavParksMap
//
//  Created by Bhumik Tandon on 3/18/25.
//
//BT
//Just wanted to mention you can swipe right to left to delete



import SwiftUI

struct PListView: View {
    @StateObject var vm = ParkVM()
    @State private var showSheet = false
    
    var body: some View {
        let sortedKeys = vm.groupedParks.keys.sorted()
        
        NavigationStack {
            List {
                ForEach(sortedKeys, id: \.self) { key in
                    if let parks = vm.groupedParks[key] {
                        ParkSectionView(key: key, parks: parks, vm: vm)
                    }
                }
            }
            .navigationTitle("My Favourite National Parks")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showSheet = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $showSheet) {
                PAddView { n, l, d, i in
                    vm.addItem(n: n, l: l, d: d, i: i)
                }
            }
        }
    }
}
