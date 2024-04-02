//
//  TestClass.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 16.01.2024.
//

private typealias user = TestUser

final class TestClass: BaseUITest {
    
    final override func setUp() {
        super.setUp()
        epic("Epic title")
        feature("Feature title")
    }
    
    func exampleTestMethod() {
    }
}
