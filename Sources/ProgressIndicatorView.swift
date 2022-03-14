//
//  ProgressIndicatorView.swift
//  ActivityIndicatorView
//
//  Created by Daniil Manin on 05.10.2021.
//  Copyright © 2021 Exyte. All rights reserved.
//

import SwiftUI

public struct ProgressIndicatorView: View {

    public enum IndicatorType {
        case `default`(progress: Binding<CGFloat>)
        case bar(progress: Binding<CGFloat>, backgroundColor: Color = .clear)
        case impulseBar(progress: Binding<CGFloat>, backgroundColor: Color = .clear)
        case dashBar(progress: Binding<CGFloat>, numberOfItems: Int = 8, backgroundColor: Color = .clear)
        case circle(progress: Binding<CGFloat>, lineWidth: CGFloat, strokeColor: Color, backgroundColor: Color = .clear)
    }

    @Binding var isVisible: Bool
    var type: IndicatorType

    public init(isVisible: Binding<Bool>, type: IndicatorType) {
        self._isVisible = isVisible
        self.type = type
    }

    public var body: some View {
        if isVisible {
            indicator
        } else {
            EmptyView()
        }
    }
    
    // MARK: - Private
    
    private var indicator: some View {
        ZStack {
            switch type {
            case .bar(let progress, let backgroundColor):
                BarView(progress: progress, backgroundColor: backgroundColor)
            case .impulseBar(let progress, let backgroundColor):
                ImpulseBarView(progress: progress, backgroundColor: backgroundColor)
            case .`default`(let progress):
                DefaultSectorView(progress: progress)
            case .circle(let progress, let lineWidth, let strokeColor, let backgroundColor):
                CircleView(progress: progress, lineWidth: lineWidth, strokeColor: strokeColor, backgroundColor: backgroundColor)
            case .dashBar(let progress, let numberOfItems, let backgroundColor):
                DashBarView(progress: progress, numberOfItems: numberOfItems, backgroundColor: backgroundColor)
            }
        }
    }
}
