//
//  DoctorTestData.swift
//  UITests
//
//  Created by PETROV Vladimir on 07.02.2024.
//

public struct DoctorTestData {
    static let doctorNameValue: String = "Агафонов Олег Алексеевич"
    static let doctorDescValue: String = "Онколог •‎ Хирург •‎ Маммолог •‎ Прием взрослых"
    static let doctorSpecializationValue: String = "Врач-хирург"
    static let clinicNameValue: String = "Клинико-диагностический центр на Белорусской"
    static let clinicAddressValue: String = "г. Москва, пер. Грузинский, д. 3А"
    
    var doctorName: String
    var doctorDesc: String
    var doctorSpecialization: String
    var clinicName: String
    var clinicAddress: String
    
    init(
        doctorName: String = "",
        doctorDesc: String = "",
        doctorSpecialization: String = "",
        clinicName: String = "",
        clinicAddress: String = ""
    ) {
        self.doctorName = doctorName
        self.doctorDesc = doctorDesc
        self.doctorSpecialization = doctorSpecialization
        self.clinicName = clinicName
        self.clinicAddress = clinicAddress
    }
}
