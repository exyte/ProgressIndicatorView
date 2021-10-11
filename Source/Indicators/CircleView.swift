//
//  CircleView.swift
//  ActivityIndicatorView
//
//  Created by Daniil Manin on 07.10.2021.
//  Copyright © 2021 Exyte. All rights reserved.
//

import SwiftUI

struct CircleView: View {
    
    @Binding var progress: CGFloat
    let lineWidth: CGFloat
    let strokeColor: Color
    let backgroundColor: Color
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Arc(startAngle: .radians(-.pi / 2), endAngle: .radians(.pi * 3 / 2))
                    .stroke(backgroundColor, style: .init(lineWidth: lineWidth, lineCap: .butt, lineJoin: .miter))
                Arc(startAngle: .radians(-.pi / 2), endAngle: .radians(.pi * 3 / 2 * progress))
                    .stroke(strokeColor, style: .init(lineWidth: lineWidth, lineCap: .butt, lineJoin: .miter))
                    .animation(.easeIn, value: progress)
            }
        }
    }
}

struct Arc: Shape {
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool = false
    
    var animatableData: CGFloat {
        get { CGFloat(endAngle.radians) }
        set { endAngle = Angle(radians: newValue) }
    }

    func path(in rect: CGRect) -> Path {
        Path { path in
            path.addArc(
                center: .init(x: rect.midX, y: rect.midY),
                radius: rect.width / 2.0,
                startAngle: startAngle,
                endAngle: endAngle,
                clockwise: clockwise)
        }
    }
}
