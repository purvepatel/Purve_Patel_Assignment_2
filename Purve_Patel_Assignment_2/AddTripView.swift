//
//  AddTripView.swift
//  Purve_Patel_Assignment_2
//
//  Created by Purve Mahesh Patel on 9/23/25.
//

import SwiftUI

struct AddTripView: View {
    @Binding var trip: Trip?
    @Environment(\.dismiss) private var dismiss

    @State private var titleText: String = ""
    @State private var locationText: String = ""
    @State private var startDate: Date = Date()
    @State private var endDate: Date = Date()
    @State private var notesText: String = ""
    @State private var selectedImageOption: String = "None"

    private let imageOptions: [String] = ["None", "rome", "banff", "tokyo"]

    private var formIsValid: Bool {
        titleText.trimmingCharacters(in: .whitespacesAndNewlines).count >= 2 &&
        locationText.trimmingCharacters(in: .whitespacesAndNewlines).count >= 2 &&
        startDate <= endDate &&
        notesText.count <= 120
    }

    private var selectedAssetName: String? {
        selectedImageOption == "None" ? nil : selectedImageOption
    }

    var body: some View {
        VStack(alignment: .leading, spacing: 14) {
            Text(trip == nil ? "Add Trip" : "Edit Trip").titleStyle()

            TextField("Title", text: $titleText)
                .textFieldStyle(.roundedBorder)
            TextField("Location", text: $locationText)
                .textFieldStyle(.roundedBorder)

            HStack {
                DatePicker("Start", selection: $startDate, displayedComponents: .date)
                DatePicker("End", selection: $endDate, displayedComponents: .date)
            }
            .font(.subheadline)

            TextEditor(text: $notesText)
                .frame(height: 80)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.3))
                )
                .onChange(of: notesText) { newValue in
                    if newValue.count > 120 {
                        notesText = String(newValue.prefix(120))
                    }
                }

            Picker("Image", selection: $selectedImageOption) {
                ForEach(imageOptions, id: \.self) { option in
                    Text(option.capitalized).tag(option)
                }
            }
            .pickerStyle(.segmented)

            if let assetName = selectedAssetName {
                Image(assetName)
                    .resizable()
                    .scaledToFit()
                    .frame(maxHeight: 90)
            }

            Spacer()

            HStack {
                Button("Cancel") { dismiss() }
                    .buttonStyle(.bordered)

                Spacer()

                Button("Save") {
                    let newTrip = Trip(
                        title: titleText.trimmingCharacters(in: .whitespacesAndNewlines),
                        location: locationText.trimmingCharacters(in: .whitespacesAndNewlines),
                        startDate: startDate,
                        endDate: endDate,
                        notes: notesText,
                        assetImageName: selectedAssetName
                    )
                    trip = newTrip
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
                .disabled(!formIsValid)
            }
        }
        .padding()
        .onAppear {
            if let t = trip {
                titleText = t.title
                locationText = t.location
                startDate = t.startDate
                endDate = t.endDate
                notesText = t.notes
                selectedImageOption = t.assetImageName ?? "None"
            }
        }
    }
}

#Preview {
    AddTripView(trip: .constant(nil))
}

