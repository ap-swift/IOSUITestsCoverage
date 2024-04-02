//
//  CarView.swift
//  UITestsPresentation
//
//  Created by Артем Парфенов on 01.04.2024.
//

import SwiftUI

struct CarView: View {
    var car: Car

    var body: some View {
        Text("\(car.brand) \(car.model)")
            .font(.title)
            .foregroundStyle(Color.blue)
            .accessibilityIdentifier("CarTitleIdentifier")
    }
}

#Preview {
    CarView(car: Car.init(brand: "Brend", model: "Model", maxSpeed: 100))
}
