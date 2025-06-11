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
    
    // MARK: CONVERSION FUNCTIONS
    // - Time Conversion
    func convertTimeToSeconds(_ value: Double, from unit: String) -> Double {
        switch unit {
        case "Hour": return value * 3600
        case "Minute": return value * 60
        case "Second": return value
        case "Millisecond": return value / 1000
        default: return 0
        }
    }
    
    func convertTimeFromSeconds(_ seconds: Double, to unit: String) -> Double {
        switch unit {
        case "Hour": return seconds / 3600
        case "Minute": return seconds / 60
        case "Second": return seconds
        case "Millisecond": return seconds * 1000
        default: return 0
        }
    }
    
    // - Length Conversion
    func convertLengthToMeters(_ value: Double, from unit: String) -> Double {
        switch unit {
        case "Kilometer": return value * 1000
        case "Meter": return value
        case "Centimeter": return value / 100
        case "Millimeter": return value / 1000
        default: return 0
        }
    }
    
    func convertLengthFromMeters(_ meters: Double, to unit: String) -> Double {
        switch unit {
        case "Kilometer": return meters / 1000
        case "Meter": return meters
        case "Centimeter": return meters * 100
        case "Millimeter": return meters * 1000
        default: return 0
        }
    }
    
    // - Temperature Conversion
    func convertTempToCelsius(_ value: Double, from unit: String) -> Double {
        switch unit {
        case "Celsius": return value
        case "Fahrenheit": return (value - 32) * 5 / 9
        case "Kelvin": return value - 273.15
        default: return 0
        }
    }
    
    func convertTempFromCelsius(_ celsius: Double, to unit: String) -> Double {
        switch unit {
        case "Celsius": return celsius
        case "Fahrenheit": return celsius * 9 / 5 + 32
        case "Kelvin": return celsius + 273.15
        default: return 0
        }
    }
}

#Preview {
    ContentView()
}
