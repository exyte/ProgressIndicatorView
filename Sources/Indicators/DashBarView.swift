//
//  DashBarView.swift
//  ProgressIndicatorView
//
//  Created by Daniil Manin on 08.10.2021.
//  Copyright © 2021 Exyte. All rights reserved.
//

import SwiftUI

struct DashBarView: View {
    
    @Binding var progress: CGFloat
    let numberOfItems: Int
    let backgroundColor: Color
    
    private let spacing: CGFloat = 4.0
    
    var body: some View {
        GeometryReader { geometry in
            let itemWidth = widthForItem(fullWidth: geometry.size.width)
            HStack(spacing: spacing) {
                ForEach(0..<numberOfItems, id: \.self) { index in
                    DashBarItemView(
                        backgroundColor: backgroundColor,
                        needToFill: progress > (1 / CGFloat(numberOfItems) * CGFloat(index)),
                        width: itemWidth)
                }
            }
        }
    }
    
    // MARK: - Private
    
    private func widthForItem(fullWidth: CGFloat) -> CGFloat {
        (fullWidth - CGFloat(numberOfItems - 1) * spacing) / CGFloat(numberOfItems)
    }
}

struct DashBarItemView: View {
    let backgroundColor: Color
    let needToFill: Bool
    let width: CGFloat
    
    var body: some View {
        ZStack(alignment: .leading) {
            Capsule()
                .foregroundColor(backgroundColor)
            Capsule()
                .frame(width: needToFill ? width : 0.0)
                .animation(.easeIn, value: needToFill)
        }
    }
}
