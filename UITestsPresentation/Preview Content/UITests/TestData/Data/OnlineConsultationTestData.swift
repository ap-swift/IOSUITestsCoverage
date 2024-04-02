//
//  OnlineConsultationTestData.swift
//  SmartMedUITests
//
//  Created by PETROV Vladimir on 25.01.2024.
//

public struct OnlineConsultationTestData {
    static let patientValue: String = "Стопкина Марина Бокалович"
    static let serviceValue: String = "Срочная онлайн-консультация"
    static let specializationValue: String = "Автотесты цены. Срочные"
    static let doctorValue: String = "Специалист"
    static let totalValue: String = "29,5 ₽"
    
    var patient: String
    var service: String
    var specialization: String
    var doctor: String
    var total: String
    
    init(
        patient: String = "",
        service: String = "",
        specialization: String = "",
        doctor: String = "",
        total: String = ""
    ) {
        self.patient = patient
        self.service = service
        self.specialization = specialization
        self.doctor = doctor
        self.total = total
    }
}
