//
//  AnimatedPlaceholder.swift
//  MathKitApp
//
//  Created by Vitali Kurlovich on 7.01.26.
//

import SwiftUI

struct AnimatedPlaceholder: View {
    @State private var animationScale = 1.0

    var body: some View {
        RoundedRectangle(cornerRadius: 150)
            .fill(.indigo.gradient.quaternary)
            .frame(width: 420, height: 340)
            .overlay {
                RoundedRectangle(cornerRadius: 140)

                    .fill(.indigo.gradient.secondary)
                    .frame(width: 400, height: 320)
                    .scaleEffect(animationScale)
            }
            .overlay {
                Image(systemName: "heart.circle.fill")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(.yellow.gradient, .green, .red.gradient)
                    .font(.system(size: 220, weight: .semibold))
                    .symbolEffect(.breathe)
                    .shadow(radius: 6, y: 3)
            }
            .padding()
            .animation(
                .easeInOut(duration: 0.9)
                    .repeatForever(autoreverses: true),
                value: animationScale
            )
            .onAppear {
                animationScale = 0.96
            }
    }
}

#Preview {
    AnimatedPlaceholder()
}
