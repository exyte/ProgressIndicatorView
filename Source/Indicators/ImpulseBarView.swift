//
//  ImpulseBarView.swift
//  ActivityIndicatorView
//
//  Created by Daniil Manin on 05.10.2021.
//  Copyright © 2021 Exyte. All rights reserved.
//

import SwiftUI

struct ImpulseBarView: View {
    
    @Binding var progress: CGFloat
    let backgroundColor: Color
    
    @State private var offset: CGFloat = -200.0 // x2 gradientWidth
    private let animation: Animation = .linear(duration: 1.5).repeatForever(autoreverses: false)
    private let gradientWidth: CGFloat = 100.0
    private let gradient = Gradient(
        colors: [
            .white.opacity(0.0),
            .white.opacity(0.25),
            .white.opacity(0.5),
            .white.opacity(0.75),
            .white.opacity(0.85),
            .white.opacity(0.75),
            .white.opacity(0.5),
            .white.opacity(0.25),
            .white.opacity(0.0)
        ]
    )
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Capsule()
                    .foregroundColor(backgroundColor)

                Capsule()
                    .animation(.easeIn, value: progress)
                    .frame(width: min(max(geometry.size.width * progress, 0), geometry.size.width))
                    .overlay(
                        LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .trailing)
                            .frame(width: gradientWidth)
                            .offset(x: offset)
                    )
                    .clipped()
            }
            .onAppear {
                withAnimation(animation) {
                    offset = geometry.size.width
                }
            }
        }
    }
}
