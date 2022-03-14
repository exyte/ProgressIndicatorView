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
    
    @State private var impulseOffset: CGFloat = -200.0 // x2 gradientWidth
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
            let width = min(max(geometry.size.width * progress, 0), geometry.size.width)
            HStack(spacing: -geometry.size.height / 2) {
                Capsule()
                    .animation(.easeIn, value: progress)
                    .frame(width: width)
                    .overlay(
                        LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .trailing)
                            .frame(width: gradientWidth)
                            .offset(x: impulseOffset)
                    )
                    .clipped()
                
                CustomRoundRect(widthOfProgressShape: width)
                    .animation(.easeIn, value: progress)
                    .foregroundColor(backgroundColor)
            }
            .onAppear {
                withAnimation(animation) {
                    impulseOffset = geometry.size.width
                }
            }
        }
    }
}

struct CustomRoundRect: Shape {
    
    let widthOfProgressShape: CGFloat
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            let width = rect.size.width
            let height = rect.size.height
            let halfHeight = height / 2
            
            if halfHeight > widthOfProgressShape {
                path.addPath(Capsule().path(in: rect))
            } else {
                path.move(to: .init(x: 0.0, y: 0.0))
                path.addLine(to: .init(x: width - halfHeight, y: 0.0))
                path.addArc(center: .init(x: width - halfHeight, y: halfHeight), radius: halfHeight, startAngle: .radians( -.pi / 2), endAngle: .radians(.pi / 2), clockwise: false)
                path.addLine(to: .init(x: 0.0, y: height))
                path.addArc(center: .init(x: 0.0, y: halfHeight), radius: halfHeight, startAngle: .radians( .pi / 2), endAngle: .radians(-.pi / 2), clockwise: true)
            }
        }
    }
}
