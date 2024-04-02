//
//  String+randomString.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 16.01.2024.
//

import Foundation

public extension String {
    static var today: String {
        guard let day = Calendar.current.dateComponents([.day], from: Date()).day else {
            return ""
        }
        return "\(day)"
    }
    static var tommorrow: String {
        guard
            let date = Calendar.current.date(byAdding: .day, value: 1, to: Date()),
            let day = Calendar.current.dateComponents([.day], from: date).day
        else {
            return ""
        }
        return "\(day)"
    }
}

extension String {
    func randomString(length: Int) -> String {
        let letters = "абвгдежзийклмнопрстуфхцчшщъыьэюя"
        return String((0..<length).map{ _ in letters.randomElement()! })
    }
}

extension String {
    func generateRandomDate() -> String? {
        let calendar = Calendar(identifier: .gregorian)
        var dateComponents = DateComponents()
        
        dateComponents.year = Int.random(in: 1950...1999)
        dateComponents.month = Int.random(in: 1...12)
        dateComponents.day = Int.random(in: 1...28)
        
        if let randomDate = calendar.date(from: dateComponents) {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd"
            return dateFormatter.string(from: randomDate)
        }
        
        return nil
    }
}
