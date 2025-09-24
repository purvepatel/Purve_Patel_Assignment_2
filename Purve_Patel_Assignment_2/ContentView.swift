//
//  ContentView.swift
//  Purve_Patel_Assignment_2
//
//  Created by Purve Mahesh Patel on 9/23/25.
//

import SwiftUI

struct ContentView: View {
    @State private var trip: Trip? = nil

    var body: some View {
        NavigationStack {
            VStack(spacing: 28) {
                VStack(spacing: 6) {
                    Text("Purve_Patel_Assignment_2")
                        .font(.largeTitle.bold())
                    Text("Tiny Multi-Screen Travel Journal")
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }

                VStack(spacing: 12) {
                    NavigationLink {
                        AddTripView(trip: $trip)
                    } label: {
                        Label("Add New Trip", systemImage: "plus.circle.fill")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.borderedProminent)
                    .controlSize(.large)

                    NavigationLink {
                        TripDetailView(trip: $trip)
                    } label: {
                        Label("View Trip", systemImage: "book.fill")
                            .frame(maxWidth: .infinity)
                    }
                    .buttonStyle(.bordered)
                    .controlSize(.large)
                }
                .padding(.horizontal)

                Spacer()

                Text("Stores exactly one trip in memory at a time.")
                    .font(.footnote)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
