//
//  Modifiers.swift
//  Purve_Patel_Assignment_2
//
//  Created by Purve Mahesh Patel on 9/23/25.
//

import SwiftUI

struct TitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2.bold())
            .foregroundColor(.primary)
            .padding(.bottom, 2)
    }
}

struct CardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color(UIColor.secondarySystemBackground))
            )
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color(UIColor.separator).opacity(0.06), lineWidth: 0.5)
            )
    }
}

extension View {
    func titleStyle() -> some View { modifier(TitleStyle()) }
    func cardStyle() -> some View { modifier(CardStyle()) }
}
