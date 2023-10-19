//
//  ContentView.swift
//  Example
//
//  Created by Daniil Manin on 07.10.2021.
//  Copyright © 2021 Exyte. All rights reserved.
//

import SwiftUI
import ProgressIndicatorView

struct ControlView: View {
    @Binding var progress: CGFloat
    @Binding var enableAutoProgress: Bool

    var body: some View {
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Text("Progess:")
                Slider(value: $progress)
            }
            Toggle("Enable auto change progress", isOn: $enableAutoProgress)
        }
        .padding(20)
        .tint(.red)
        .foregroundColor(.red)
    }
}

struct ContentView: View {
    
    @State private var showProgressIndicator: Bool = true
    @State private var progress: CGFloat = 0.0
    @State private var enableAutoProgress: Bool = true
    @State private var progressForDefaultSector: CGFloat = 0.0
    
    private let timer = Timer.publish(every: 1 / 5, on: .main, in: .common).autoconnect()
    
    var body: some View {
        GeometryReader { geometry in
            let size = geometry.size.width / 5
            
            VStack {
                Spacer()
                
                ProgressIndicatorView(isVisible: $showProgressIndicator, type: .bar(progress: $progress, backgroundColor: .gray.opacity(0.25)))
                    .frame(height: 8.0)
                    .foregroundColor(.red)
                    .padding([.bottom, .horizontal], size)
                    
                ProgressIndicatorView(isVisible: $showProgressIndicator, type: .impulseBar(progress: $progress, backgroundColor: .gray.opacity(0.25)))
                    .frame(height: 8.0)
                    .foregroundColor(.red)
                    .padding([.bottom, .horizontal], size)
                
                ProgressIndicatorView(isVisible: $showProgressIndicator, type: .dashBar(progress: $progress, numberOfItems: 8, backgroundColor: .gray.opacity(0.25)))
                    .frame(height: 12.0)
                    .foregroundColor(.red)
                    .padding([.bottom, .horizontal], size)
                
                HStack {
                    Spacer()
                    ProgressIndicatorView(isVisible: $showProgressIndicator, type: .default(progress: $progressForDefaultSector))
                        .foregroundColor(.red)
                        .frame(width: size, height: size)
                    Spacer()
                    ProgressIndicatorView(isVisible: $showProgressIndicator, type: .circle(progress: $progress, lineWidth: 8.0, strokeColor: .red, backgroundColor: .gray.opacity(0.25)))
                        .frame(width: size, height: size)
                    Spacer()
                }
                
                Spacer()
            }
        }
        .overlay(
            ControlView(
                progress: $progress,
                enableAutoProgress: $enableAutoProgress
            ),
            alignment: .bottom
        )
        .onReceive(timer) { _ in
            guard enableAutoProgress else { return }
            switch progress {
            case ...0.3, 0.4...0.6:
                progress += 1 / 30
            case 0.3...0.4, 0.6...0.9:
                progress += 1 / 120
            case 0.9...0.99:
                progress = 1
            case 1.0...:
                progress = 0
            default:
                break
            }
            
            if progressForDefaultSector >= 1.5 {
                progressForDefaultSector = 0
            } else {
                progressForDefaultSector += 1 / 10
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

