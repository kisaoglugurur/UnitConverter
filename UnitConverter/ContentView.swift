//
//  ContentView.swift
//  UnitConverter
//
//  Created by Gurur on 11.06.2025.
//

import SwiftUI

struct ContentView: View {
    // MARK: STATE VARIABLE FOR HIDING KEYBOARD
    @FocusState private var isFocused: Bool

    // MARK: UNIT TYPES
    let unitTypes = ["Time", "Length", "Temperature"]
    @State private var selectedUnitType = "Time"
    
    // MARK: UNITS
    let timeUnits: [String] = ["Hour", "Minute", "Second", "Millisecond"]
    let lengthUnits: [String] = ["Kilometer", "Meter", "Centimeter", "Millimeter"]
    let temperatureUnits: [String] = ["Celsius", "Fahrenheit", "Kelvin"]
    
    // MARK: INPUT / OUTPUT VARIABLES
    @State private var selectedInputUnit: String = "Hour"
    @State private var selectedOutputUnit: String = "Minute"
    @State private var inputValue: Double = 1.0
    
    // MARK: COMPUTED OUTPUT VALUE
    var outputValue: Double {
        switch selectedUnitType {
        case "Time":
            let seconds = convertTimeToSeconds(inputValue, from: selectedInputUnit)
            return convertTimeFromSeconds(seconds, to: selectedOutputUnit)
        case "Length":
            let meters = convertLengthToMeters(inputValue, from: selectedInputUnit)
            return convertLengthFromMeters(meters, to: selectedOutputUnit)
        case "Temperature":
            let celsius = convertTempToCelsius(inputValue, from: selectedInputUnit)
            return convertTempFromCelsius(celsius, to: selectedOutputUnit)
        default:
            return 0
        }
    }

    var body: some View {
        NavigationStack {
            Form {
                Section("Unit type") {
                    Picker("Unit type", selection: $selectedUnitType) {
                        ForEach(unitTypes, id: \.self) { Text($0) }
                    }
                    .pickerStyle(.segmented)
                    .onChange(of: selectedUnitType) {
                        updateUnitSelections(for: selectedUnitType)
                    }
                }
                
                Section("Input Section") {
                    Picker("Input Unit", selection: $selectedInputUnit) {
                        ForEach(units(for: selectedUnitType), id: \.self) { Text($0) }
                    }
                    .pickerStyle(.segmented)
                    
                    TextField("Value", value: $inputValue, format: .number)
                        .keyboardType(.decimalPad)
                        .focused($isFocused)
                }
                
                Section("Output Section") {
                    Picker("Output Unit", selection: $selectedOutputUnit) {
                        ForEach(units(for: selectedUnitType), id: \.self) { Text($0) }
                    }
                    .pickerStyle(.segmented)
                    
                    Text("\(outputValue, specifier: "%.2f") \(selectedOutputUnit)")
                }
            }
            .navigationTitle("Unit Converter")
            .toolbar {
                if isFocused {
                    Button("Done") {
                        isFocused = false
                    }
                }
            }
        }
    }
    
    // MARK: HELPER FUNCTIONS
    func units(for type: String) -> [String] {
        switch type {
        case "Time": return timeUnits
        case "Length": return lengthUnits
        case "Temperature": return temperatureUnits
        default: return []
        }
    }
    
    func updateUnitSelections(for type: String) {
        let units = units(for: type)
        selectedInputUnit = units.first ?? ""
        selectedOutputUnit = units.dropFirst().first ?? units.first ?? ""
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
