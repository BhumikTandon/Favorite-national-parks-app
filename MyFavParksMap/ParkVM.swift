//
//  ParkVM.swift
//  MyFavParksMap
//
//  Created by Bhumik Tandon on 3/18/25.
//
//BT

//Just wanted to mention you can swipe right to left to delete

import SwiftUI

@MainActor
class ParkVM: ObservableObject {
    @Published var items: [Park] = [
        Park(
            nm: "Kaziranga National Park",
            loc: "Assam, India",
            desc: "Known for the one-horned rhinoceros, lush forests, and wetlands.",
            img: "kaziranga"
        ),
        Park(
            nm: "Jim Corbett National Park",
            loc: "Uttarakhand, India",
            desc: "Famous for Bengal tigers, diverse wildlife, and scenic landscapes.",
            img: "jimcorbett"
        ),
        Park(
            nm: "Ranthambore National Park",
            loc: "Rajasthan, India",
            desc: "Renowned for Bengal tigers and the historic Ranthambore Fort.",
            img: "ranthambore"
        ),
        Park(
            nm: "Gir National Park",
            loc: "Gujarat, India",
            desc: "Home to the Asiatic lion, grasslands, and a variety of bird species.",
            img: "gir"
        ),
        Park(
            nm: "Kanha National Park",
            loc: "Madhya Pradesh, India",
            desc: "Lush meadows, Bengal tigers, and barasingha (swamp deer).",
            img: "kanha"
        )
    ]
    
    init() {
        sortItems()
    }
    
    func addItem(n: String, l: String, d: String, i: String?) {
        let p = Park(
            nm: n,
            loc: l,
            desc: d,
            img: (i?.isEmpty == false) ? i! : "defaultPark"
        )
        items.append(p)
        sortItems()
    }
    
    func delItem(_ offs: IndexSet) {
        items.remove(atOffsets: offs)
    }
    
    private func sortItems() {
        items.sort { $0.nm < $1.nm }
    }
    var groupedParks: [String: [Park]] {
        Dictionary(grouping: items, by: { String($0.nm.prefix(1)) })
    }
}
