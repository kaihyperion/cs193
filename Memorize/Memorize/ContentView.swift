//
//  ContentView.swift
//  Memorize
//
//  Created by Kai Yun on 2/15/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle.fill.badge.minus")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("This is Text")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
