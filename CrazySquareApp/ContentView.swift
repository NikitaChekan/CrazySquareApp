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
        ZStack {
            VStack(spacing: 0) {
                Color.white
                Color.pink
                Color.yellow
                Color.black
            }
            .ignoresSafeArea()
        }
        .overlay() {
            ZStack {
                Rectangle()
                    .blendMode(.exclusion)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                Rectangle()
                    .blendMode(.color)
                    .cornerRadius(15)
                Rectangle()
                    .blendMode(.overlay)
                    .foregroundColor(.white)
                    .cornerRadius(15)
                Rectangle()
                    .blendMode(.overlay)
                    .foregroundColor(.black)
                    .cornerRadius(15)
            }
            .frame(width: 150, height: 150)
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
}

#Preview {
    ContentView()
}
