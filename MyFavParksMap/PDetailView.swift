//
//  PDetailView.swift
//  MyFavParksMap
//
//  Created by Bhumik Tandon on 3/18/25.
//
//BT

//Just wanted to mention you can swipe right to left to delete


import SwiftUI
import MapKit
import CoreLocation

struct PDetailView: View {
    let park: Park
    
    @State private var reg = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 20.5937, longitude: 78.9629),
        span: MKCoordinateSpan(latitudeDelta: 5, longitudeDelta: 5)
    )
    @State private var coord: CLLocationCoordinate2D?
    
    @State private var srch = ""
    @State private var pins: [Pin] = []
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(park.nm)
                    .font(.largeTitle)
                    .padding(.horizontal)
                Image(park.img)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .padding(.horizontal)
                Text(park.desc)
                    .font(.body)
                    .padding(.horizontal)
                if let c = coord {
                    Text("Latitude: \(c.latitude)")
                        .padding(.horizontal)
                    Text("Longitude: \(c.longitude)")
                        .padding(.horizontal)
                }
                HStack {
                    TextField("Search (e.g. 'coffee')", text: $srch)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button("Go") {
                        Task {
                            await searchNearby()
                        }
                    }
                }
                .padding(.horizontal)
                Map(coordinateRegion: $reg, annotationItems: pins) { p in
                    MapMarker(coordinate: p.coord)
                }
                .frame(height: 300)
                .cornerRadius(8)
                .padding()
            }
        }
        .onAppear {
            geocodeLoc()
        }
        .navigationBarTitleDisplayMode(.inline)
    }
    
    func geocodeLoc() {
        let geo = CLGeocoder()
        geo.geocodeAddressString(park.loc) { pms, err in
            guard err == nil, let loc = pms?.first?.location else {
                return
            }
            coord = loc.coordinate
            reg = MKCoordinateRegion(
                center: loc.coordinate,
                span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
            )
        }
    }
    
    func searchNearby() async {
        guard !srch.isEmpty else { return }
        let req = MKLocalSearch.Request()
        req.naturalLanguageQuery = srch
        req.region = reg
        let search = MKLocalSearch(request: req)
        do {
            let resp = try await search.start()
            pins = resp.mapItems.map {
                Pin(nm: $0.name ?? "", coord: $0.placemark.coordinate)
            }
        } catch {
        }
    }
}

struct Pin: Identifiable {
    let id = UUID()
    var nm: String
    var coord: CLLocationCoordinate2D
}
