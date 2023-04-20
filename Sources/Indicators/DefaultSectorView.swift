//
//  DefaultSectorView.swift
//  ActivityIndicatorView
//
//  Created by Daniil Manin on 06.10.2021.
//  Copyright © 2021 Exyte. All rights reserved.
//

import SwiftUI

struct DefaultSectorView: View {

    @Binding var progress: CGFloat
    
    private let count: Int = 8
    @State private var rotationAngle: Angle = .radians(0)
    
    public var body: some View {
        GeometryReader { geometry in
            Group {
                ForEach(0..<count, id: \.self) { index in
                    DefaultSectorItemView(index: index, count: count, size: geometry.size)
                        .opacity(progress * 2.0 - CGFloat(index) * 1 / CGFloat(count) - 0.1)
                        .animation(.linear, value: progress)
                }
            }
            .rotationEffect(rotationAngle)
            .frame(width: geometry.size.width, height: geometry.size.height)
            .onChange(of: progress) { _ in
                if progress > 1.0 {
                    withAnimation(.linear(duration: 1)) {
                        rotationAngle = .radians(.pi * 2.0)
                    }
                } else {
                    rotationAngle = .zero
                }
            }
        }
    }
}

struct DefaultSectorItemView: View {
    let index: Int
    let count: Int
    let size: CGSize

    var body: some View {
        let height = size.height / 3.2
        let width = height / 2
        let angle = 2 * .pi / CGFloat(count) * CGFloat(index) - .pi / 2
        let x = (size.width / 2 - height / 2) * cos(angle)
        let y = (size.height / 2 - height / 2) * sin(angle)
        
        return RoundedRectangle(cornerRadius: width / 2 + 1)
            .frame(width: width, height: height)
            .rotationEffect(.radians(angle + .pi / 2))
            .offset(x: x, y: y)
    }
}
