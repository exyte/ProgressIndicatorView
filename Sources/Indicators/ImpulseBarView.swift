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

    @State private var size: CGSize = .zero
    @State private var progressWidth: CGFloat = 0
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
        Capsule()
            .fill(backgroundColor)
            .sizeGetter($size)
            .overlay(
                CapsuleProgressView(width: progressWidth, height: size.height)
            )
            .overlay(gradientView)
            .animation(.easeIn, value: progressWidth)
            .onChange(of: size) { size in
                progressWidth = fmin(fmax(size.width * progress, 0), size.width)
                withAnimation(animation) {
                    impulseOffset = size.width + 200
                }
            }
            .onChange(of: progress) { progress in
                progressWidth = fmin(fmax(size.width * progress, 0), size.width)
            }
    }

    private var gradientView: some View {
        HStack {
            LinearGradient(gradient: gradient, startPoint: .leading, endPoint: .trailing)
                .frame(width: gradientWidth)
                .offset(x: impulseOffset)

            Spacer(minLength: 0)
        }
        .mask(CapsuleProgressView(width: progressWidth, height: size.height))
    }
}

struct CapsuleProgressView: View {
    let width: CGFloat
    let height: CGFloat

    var body: some View {
        HStack {
            Capsule()
                .frame(width: width < height ? height : width)
                .mask(
                    Capsule()
                        .frame(width: width < height ? height : width)
                        .offset(x: width < height ? width - height : 0)
                )
            Spacer(minLength: 0)
        }
    }
}


struct ImpulseBarView_Preview: PreviewProvider {
    static let items: [CGFloat] = [0, 0.2, 0.5, 0.8, 1]

    static var previews: some View {
        VStack {
            ForEach(items, id: \.self) { item in
                ImpulseBarView(
                    progress: .constant(item),
                    backgroundColor: .gray
                )
                .frame(height: 10)
                .foregroundColor(.blue)

                ImpulseBarView(
                    progress: .constant(item),
                    backgroundColor: .gray
                )
                .frame(height: 10)
                .foregroundColor(.red)
            }
        }
        .padding(.horizontal, 30)
    }
}
