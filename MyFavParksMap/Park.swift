//
//  Park.swift
//  MyFavParksMap
//
//  Created by Bhumik Tandon on 3/18/25.
//
//BT
//Just wanted to mention you can swipe right to left to delete


import SwiftUI
import CoreLocation

struct Park: Identifiable, Equatable {
    let id = UUID()
    var nm: String
    var loc: String
    var desc: String
    var img: String
}
