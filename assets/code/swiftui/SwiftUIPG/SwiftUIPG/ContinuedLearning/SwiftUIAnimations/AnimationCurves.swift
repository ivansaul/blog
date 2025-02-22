//
//  AnimationCurves.swift
//  SwiftUIPG
//
//  Created by @ivansaul on 2/22/25.
//
//  https://github.com/ivansaul
//

import SwiftUI

struct AnimationCurves: View {
    @State private var isAnimating: Bool = false

    var body: some View {
        VStack(spacing: 20) {
            itemRow(title: "linear", animation: .linear(duration: 2))
            itemRow(title: "easeIn", animation: .easeIn(duration: 2))
            itemRow(title: "easeOut", animation: .easeOut(duration: 2))
            itemRow(title: "easeInOut", animation: .easeInOut(duration: 2))
            itemRow(title: "spring", animation: .spring(response: 2))

            Button("Start") {
                isAnimating.toggle()
            }
            .buttonStyle(.bordered)
        }
        .padding()
    }

    func itemRow(title: String, animation: Animation) -> some View {
        VStack {
            HStack {
                Text(title)
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.blue)
                    .frame(width: 90, alignment: .leading)

                Image(systemName: "tortoise.fill")
                    .foregroundStyle(.orange)
                    .offset(x: isAnimating ? 200 : 0)
                    .animation(animation, value: isAnimating)

                Spacer()
            }
            Divider()
        }
    }
}

#Preview {
    AnimationCurves()
}
