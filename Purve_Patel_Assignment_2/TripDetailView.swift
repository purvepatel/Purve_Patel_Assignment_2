//
//  TripDetailView.swift
//  Purve_Patel_Assignment_2
//
//  Created by Purve Mahesh Patel on 9/23/25.
//

import SwiftUI

struct TripDetailView: View {
    @Binding var trip: Trip?

    private let dateFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .medium
        return f
    }()

    var body: some View {
        VStack(spacing: 14) {
            if let trip = trip {
                if let imageName = trip.assetImageName {
                    Image(imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(maxHeight: 150)
                        .cornerRadius(10)
                }

                VStack(alignment: .leading, spacing: 8) {
                    Text(trip.title).titleStyle()
                    Text(trip.location).font(.headline)

                    Text("\(dateFormatter.string(from: trip.startDate)) – \(dateFormatter.string(from: trip.endDate))")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    let days = Calendar.current.dateComponents([.day], from: trip.startDate, to: trip.endDate).day ?? 0
                    Text("Duration: \(days + 1) days")
                        .font(.footnote)
                        .foregroundColor(.secondary)

                    Text(trip.notes)
                        .lineLimit(2)
                        .font(.body)
                }
                .cardStyle()

                NavigationLink {
                    AddTripView(trip: $trip)
                } label: {
                    Label("Edit", systemImage: "pencil")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
            } else {
                VStack(spacing: 12) {
                    Text("No trip saved yet.").font(.headline)
                    Text("Tap below to add your first trip.")
                        .font(.subheadline)
                        .foregroundColor(.secondary)

                    NavigationLink {
                        AddTripView(trip: $trip)
                    } label: {
                        Label("Add New Trip", systemImage: "plus")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .cardStyle()
            }

            Spacer()
        }
        .padding()
    }
}

#Preview {
    TripDetailView(trip: .constant(nil))
}
