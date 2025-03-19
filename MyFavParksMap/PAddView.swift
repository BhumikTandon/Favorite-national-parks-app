//
//  PAddView.swift
//  MyFavParksMap
//
//  Created by Bhumik Tandon on 3/18/25.
//
//BT
//Just wanted to mention you can swipe right to left to delete

import SwiftUI

struct PAddView: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var n = ""
    @State private var l = ""
    @State private var d = ""
    @State private var i = ""
    
    var addFn: (String, String, String, String?) -> Void
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Park Info") {
                    TextField("Name", text: $n)
                    TextField("Location", text: $l)
                    TextField("Description", text: $d)
                        .lineLimit(3, reservesSpace: true)
                }
                Section("Image Name (Optional)") {
                    TextField("e.g. 'kaziranga'", text: $i)
                        .textInputAutocapitalization(.never)
                }
            }
            .navigationTitle("Add Park")
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Add") {
                        addFn(n, l, d, i)
                        dismiss()
                    }
                    .disabled(n.isEmpty || l.isEmpty)
                }
            }
        }
    }
}
