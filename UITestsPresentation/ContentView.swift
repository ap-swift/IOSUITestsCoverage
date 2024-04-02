//
//  ContentView.swift
//  UITestsPresentation
//
//  Created by Артем Парфенов on 01.04.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to our car store")
                    .font(.title)
                    .fontWeight(.medium)
                    .padding()
                    .background(.green)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .padding(.bottom, 10)


                NavigationLink {
                    CarsListView()
                } label: {
                    HStack {
                        Image(systemName: "car")
                            .imageScale(.large)
                            .foregroundStyle(.tint)
                            .accessibilityIdentifier("carImageIdentifier")
                        Text("Choose your auto")
                            .font(.title)
                            .accessibilityIdentifier("chooseCarTextIdentifier")
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
