//
//  ParkRow.swift
//  MyFavParksMap
//
//  Created by Bhumik Tandon on 3/18/25.
//
//BT
//Just wanted to mention you can swipe right to left to delete


import SwiftUI

struct ParkRow: View {
    let park: Park
    
    var body: some View {
        HStack {
            Image(park.img)
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
                .clipShape(RoundedRectangle(cornerRadius: 5))
            
            VStack(alignment: .leading) {
                Text(park.nm)
                    .font(.headline)
                Text(park.loc)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
        }
    }
}
