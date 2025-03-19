//
//  MyFavParksMapApp.swift
//  MyFavParksMap
//
//  Created by Bhumik Tandon on 3/18/25.
//

//Just wanted to mention you can swipe right to left to delete
//BT

import SwiftUI

@main
struct MyFavParksMap: App {
    var body: some Scene {
        WindowGroup {
            PListView()
        }
    }
}

#Preview {
    PListView()
}
