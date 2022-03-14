//
//  BarView.swift
//  ActivityIndicatorView
//
//  Created by Daniil Manin on 16.09.2021.
//  Copyright © 2021 Exyte. All rights reserved.
//

import SwiftUI

struct BarView: View {
    
    @Binding var progress: CGFloat
    let backgroundColor: Color
    
    var body: some View {
        GeometryReader { geometry in
            ZStack(alignment: .leading) {
                Capsule()
                    .foregroundColor(backgroundColor)
                Capsule()
                    .frame(width: min(max(geometry.size.width * progress, 0), geometry.size.width))
                    .animation(.easeIn, value: progress)
            }
        }
    }
}
