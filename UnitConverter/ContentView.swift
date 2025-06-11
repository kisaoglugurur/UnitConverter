//
//  ContentView.swift
//  UnitConverter
//
//  Created by Gurur on 11.06.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section("Unit type") {
                    Text("Unit type picker")
                }
                
                Section("Input Section") {
                    Text("Input type picker")
                    TextField("Input", text: .constant(""))
                }
                
                Section("Output Section") {
                    Text("Output type picker")
                    Text("Output")
                }
            }
            .navigationTitle("Unit Converter")
        }
    }
}

#Preview {
    ContentView()
}
