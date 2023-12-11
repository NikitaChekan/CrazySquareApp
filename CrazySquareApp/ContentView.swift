//
//  ContentView.swift
//  CrazySquareApp
//
//  Created by jopootrivatel on 11.12.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var movingSquare = CGSize.zero
    
    var body: some View {
        GeometryReader { proxy in
            let width = proxy.size.width
            let height = proxy.size.height / 4
            
            VStack(spacing: 0) {
                Rectangle()
                    .frame(width: width, height: height)
                    .foregroundColor(.white)
                Rectangle()
                    .frame(width: width, height: height)
                    .foregroundColor(.pink)
                Rectangle()
                    .frame(width: width, height: height)
                    .foregroundColor(.yellow)
                Rectangle()
                    .frame(width: width, height: height)
                    .foregroundColor(.black)
            }
            .overlay() {
                Rectangle()
                    .blendMode(.exclusion)
                    .frame(width: 150, height: 150)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                    .offset(movingSquare)
                    .gesture(
                        DragGesture()
                            .onChanged { movingSquare = $0.translation }
                            .onEnded { _ in
                                withAnimation(.spring()) {
                                    movingSquare = .zero
                                }
                            }
                    )
            }
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    ContentView()
}
