import Foundation
import XCTest

extension XCTest {
    func feature(_ values: String...) {
        label(name: "feature", values: values)
    }

    private func label(name: String, values: [String]) {
        for value in values {
            XCTContext.runActivity(named: "allure.label." + name + ":" + value, block: { _ in })
        }
    }

    func link(_ value: String) {
        links(name: value, values: ["https://team-z7xn.testit.software/projects/6/tests/" + value])
    }

    private func links(name: String, values: [String]) {
        for value in values {
            XCTContext.runActivity(named: "allure.link." + name + ":" + value, block: { _ in })
        }
    }

    func description(_ value: String) {
        XCTContext.runActivity(named: value, block: { _ in })
    }

    // Allure предоставляет варианты: BLOCKER, CRITICAL, NORMAL, MINOR или TRIVIAL.
    func severity(_ values: String...) {
        label(name: "severity", values: values)
    }

    func step(_ name: String, step: () -> Void) {
        XCTContext.runActivity(named: name) { _ in
            step()
        }
    }

    func epic(_ values: String...) {
        label(name: "epic", values: values)
    }
}

