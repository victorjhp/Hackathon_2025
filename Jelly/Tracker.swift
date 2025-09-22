//
//  Learn.swift
//  Jelly
//
//  Created by Benjamin Chung on 1/11/25.
//

import SwiftUI

// Define a custom struct for HealthRecord
struct HealthRecord: Codable, Identifiable {
    let id: UUID // Unique identifier for each record
    let percentage: Double
    let disease: String
}

struct Learn: View {
    @State private var records: [HealthRecord] = UserDefaults.standard.getHealthRecords() // Persistent data storage
    @State private var newPercentage: String = "" // Input for new percentage
    @State private var newDisease: String = "" // Input for disease
    @FocusState private var isInputFocused: Bool // Manages keyboard dismissal

    var body: some View {
        NavigationView {
            
            ZStack{
                LinearGradient(colors: [.lgreen, .white],
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all)
                
                
                VStack(spacing: 20) {
                    // Title
                    Text("Your Health Tracker")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    // Input Section
                    HStack(spacing: 10) {
                        VStack(alignment: .leading, spacing: 10) {
                            TextField("Enter percentage (0-100 %)", text: $newPercentage)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .keyboardType(.decimalPad)
                                .focused($isInputFocused)
                            
                            TextField("Enter health data", text: $newDisease)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .focused($isInputFocused)
                        }
                        
                        Button(action: {
                            addRecord()
                            isInputFocused = false // Dismiss keyboard after adding
                        }) {
                            Text("Add")
                                .padding(.vertical, 10)
                                .padding(.horizontal, 20)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        }
                    }
                    .padding()
                    
                    // Log Section
                    ScrollView {
                        VStack(alignment: .leading, spacing: 10) {
                            if records.isEmpty {
                                Text("No data yet. Add your health records.")
                                    .foregroundColor(.gray)
                                    .padding()
                            } else {
                                ForEach(records) { record in
                                    HStack {
                                        Text("#\(records.firstIndex(where: { $0.id == record.id })! + 1):")
                                            .bold()
                                            .frame(width: 40, alignment: .leading)
                                        
                                        Text("\(record.percentage, specifier: "%.1f")%")
                                            .frame(width: 100, alignment: .leading)
                                        
                                        Text(record.disease)
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                        
                                        Button(action: {
                                            deleteRecord(record)
                                        }) {
                                            Image(systemName: "trash")
                                                .foregroundColor(.red)
                                        }
                                    }
                                    .padding(10)
                                    .background(Color.white)
                                    .cornerRadius(8)
                                    .shadow(radius: 2)
                                }
                            }
                        }
                        .padding()
                    }
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    
                    Spacer()
                }
                .padding()
                .background(Color.gray.opacity(0.1).edgesIgnoringSafeArea(.all)) // Light gray background
            }
        }
        }
        
        // Add record to the list
        private func addRecord() {
            guard let percentage = Double(newPercentage),
                  percentage >= 0 && percentage <= 100,
                  !newDisease.isEmpty else {
                newPercentage = "" // Clear invalid input
                newDisease = ""
                return
            }
            
            // Append new record
            let newRecord = HealthRecord(id: UUID(), percentage: percentage, disease: newDisease)
            records.append(newRecord)
            saveRecords()
            newPercentage = "" // Clear inputs after adding
            newDisease = ""
        }
        
        // Delete record from the list
        private func deleteRecord(_ record: HealthRecord) {
            records.removeAll { $0.id == record.id }
            saveRecords()
        }
        
        // Save records to UserDefaults
        private func saveRecords() {
            UserDefaults.standard.saveHealthRecords(records)
        }
    
}

// MARK: - UserDefaults Extension
    extension UserDefaults {
        private static let healthRecordsKey = "healthRecords"
        
        func saveHealthRecords(_ records: [HealthRecord]) {
            let encodedData = try? JSONEncoder().encode(records)
            self.set(encodedData, forKey: UserDefaults.healthRecordsKey)
        }
        
        func getHealthRecords() -> [HealthRecord] {
            guard let data = self.data(forKey: UserDefaults.healthRecordsKey),
                  let decodedData = try? JSONDecoder().decode([HealthRecord].self, from: data) else {
                return []
            }
            return decodedData
        }
    
}

#Preview {
    Learn()
}

