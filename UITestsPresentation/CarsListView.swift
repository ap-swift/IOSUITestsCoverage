//
//  FirstView.swift
//  UITestsPresentation
//
//  Created by Артем Парфенов on 01.04.2024.
//

import SwiftUI

struct CarsListView: View {
    var cars: [Car] = [
        Car(brand: "BMW", model: "I8", maxSpeed: 300),
        Car(brand: "Hyundai", model: "Sonata", maxSpeed: 170)
    ]

    var body: some View {
        NavigationView {
            List(cars, id: (\.model)) { car in
                    NavigationLink(destination: CarView(car: car)) {
                        Text("\(car.brand) \(car.model)")
                    }
                }
                .navigationTitle("List of Cars")
        }
    }
}

struct Car {
    var brand: String
    var model: String
    var maxSpeed: Double
}

#Preview {
    CarsListView()
}
