//
//  PartsOfAnimation.swift
//  SwiftUIPG
//
//  Created by @ivansaul on 2/22/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct PartsOfAnimation: View {
    @State private var isAnimating: Bool = false

    var body: some View {
        VStack {
            Circle()
                .fill(.blue)
                .frame(width: 50, height: 50)
                .offset(y: isAnimating ? 100 : 0)
                .animation(.easeInOut, value: isAnimating)

            Spacer()

            Button("Start Animation") {
                isAnimating.toggle()
            }
            .buttonStyle(.bordered)
        }
        .frame(height: 200)
    }
}

#Preview {
    PartsOfAnimation()
}
