//
//  AppointmentClinicTestData.swift
//  UITests
//
//  Created by PETROV Vladimir on 02.02.2024.
//

public struct AppointmentClinicTestData {
    static let specializationValue: String = "Аллерголог-иммунолог"
    static let doctorNameValue: String = "Артамонова Анастасия Васильевна"
    static let doctorSpecializationValue: String = "Врач-аллерголог-иммунолог"
    static let patientValue: String = "Стопкина Марина Бокалович"
    static let clinicValue: String = "Клинико-диагностический центр в Грохольском переулке"
    static let clinicAddressValue: String = "г. Москва, пр-кт. Мира, д. 26, стр. 6"
    static let clinicTimeValue: String = "  Ежедневно с 8:00 до 21:00"
    
    var specialization: String
    var doctorName: String
    var doctorSpecialization: String
    var patient: String
    var clinic: String
    var clinicAddress: String
    var clinicTime: String
    
    init(
        specialization: String = "",
        doctorName: String = "",
        doctorSpecialization: String = "",
        patient: String = "",
        clinic: String = "",
        clinicAddress: String = "",
        clinicTime: String = ""
    ) {
        self.specialization = specialization
        self.doctorName = doctorName
        self.doctorSpecialization = doctorSpecialization
        self.patient = patient
        self.clinic = clinic
        self.clinicAddress = clinicAddress
        self.clinicTime = clinicTime
    }
}
