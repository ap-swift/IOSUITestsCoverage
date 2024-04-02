//
//  Appointment.swift
//  SmartMed
//
//  Created by Артем Парфенов on 18.08.2023.
//

import Foundation

private typealias apiConfig = APIConfig
private var apiAuthorization = ApiAuthorization()

// MARK: API запросы
class ApiAppointment {
    
    func createCount(userID: String) -> String {
        let urlString = apiConfig.mainUrl + "/gateway-preprod/proxyapi/carts/v2/carts/8ae13c50-46ea-4b21-9432-7af88d68944e/confirmation"
        let body =  ["clinic_code": "KPPR"]
        
        var request = URLRequest(url: URL(string: urlString)!)
        
        var countNumber: String?
        let semaphore = DispatchSemaphore(value: 0)
        
        request.httpMethod = "POST"
        
        request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.addValue("\(userID)", forHTTPHeaderField: "PatientId")
        request.addValue("Bearer Developer UserId:\(userID)", forHTTPHeaderField: "Authorization")
        request.addValue(apiConfig.deviceToken, forHTTPHeaderField: "Device-Token")
        request.addValue(apiConfig.OSType, forHTTPHeaderField: "Os-Type")
        request.addValue(apiConfig.OSVersion, forHTTPHeaderField: "Os-Version")
        request.addValue(apiConfig.userAgent, forHTTPHeaderField: "User-Agent")
        request.addValue(apiConfig.applicationVersion, forHTTPHeaderField: "Application-Version")
        
        request.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
            }
            
            if let response = response as? HTTPURLResponse {
                print("StatusCode: \(response.statusCode)")
            }
            
            if let data = data {
                if let dataString = String(data: data, encoding: .utf8) {
                    print("Response:", dataString)
                    countNumber = dataString
                }
            }
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
        return countNumber!
    }
    
    
    func getCountStatus(userID: String, countNumber: String) -> String {
        let urlString = apiConfig.mainUrl + "/gateway-preprod/proxyapi/carts/v2/carts/order/\(countNumber)"
        
        var request = URLRequest(url: URL(string: urlString)!)
        
        request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.addValue("\(userID)", forHTTPHeaderField: "PatientId")
        request.addValue("Bearer Developer UserId:\(userID)", forHTTPHeaderField: "Authorization")
        request.addValue(apiConfig.deviceToken, forHTTPHeaderField: "Device-Token")
        request.addValue(apiConfig.OSType, forHTTPHeaderField: "Os-Type")
        request.addValue(apiConfig.OSVersion, forHTTPHeaderField: "Os-Version")
        request.addValue(apiConfig.userAgent, forHTTPHeaderField: "User-Agent")
        request.addValue(apiConfig.applicationVersion, forHTTPHeaderField: "Application-Version")
        
        let semaphore = DispatchSemaphore(value: 0)
        
        var state: String?
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            if let response = response as? HTTPURLResponse {
                print("StatusCode: \(response.statusCode)")
            }
            
            if let data = data {
                guard let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                      let fetchedState = json["order_state"] as? String else { return }
                print("Response:", fetchedState)
                state = fetchedState
            }
            
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        return state!
    }
    
    func addPatient(userid: Int) -> (status: String, patientId: Int)  {
        
        let urlString = apiConfig.mainUrl + "/gateway-preprod/api/users/addpatient/v2"
        let firstName = String((0..<7).map{ _ in "абвгдежзийклмнопрс".randomElement()! })
        let patronymic = String((0..<7).map{ _ in "абвгдежзийклмнопрс".randomElement()! })
        let lastName = String((0..<7).map{ _ in "абвгдежзийклмнопрс".randomElement()! })
        let date = "".generateRandomDate()!
        let body: [String: Any] =  ["gender": 1,"patronymic": patronymic,"firstName": firstName,"isClient": false,"patientTypeForRegistration": 1,"birthday": date,"withoutPatronymic": false,"lastName": lastName]
        
        var request = URLRequest(url: URL(string: urlString)!)
        
        request.httpMethod = "POST"
        request.addValue("application/json; charset=UTF-8", forHTTPHeaderField: "Content-Type")
        request.addValue("\(userid)", forHTTPHeaderField: "PatientId")
        request.addValue("Bearer Developer UserId:\(userid)", forHTTPHeaderField: "Authorization")
        request.addValue(apiConfig.deviceToken, forHTTPHeaderField: "Device-Token")
        request.addValue(apiConfig.OSType, forHTTPHeaderField: "Os-Type")
        request.addValue(apiConfig.OSVersion, forHTTPHeaderField: "Os-Version")
        request.addValue(apiConfig.userAgent, forHTTPHeaderField: "User-Agent")
        request.addValue(apiConfig.applicationVersion, forHTTPHeaderField: "Application-Version")
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
        } catch {
            print("Error encoding JSON: \(error)")
            return ("", 1)
        }
        
        var status: String?
        var patientId: Int?
        let semaphore = DispatchSemaphore(value: 0)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error: \(error)")
            }
            
            if let response = response as? HTTPURLResponse {
                print("StatusCode: \(response.statusCode)")
            }
            
            if let data = data {
                guard let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                      let statusInfo = json["statusInfo"] as? [String: Any],
                      let expectedStatus = statusInfo["status"] as? String,
                      let patientData = json["data"] as? [String: Any],
                      let createdPatientId = patientData["patientId"] as? Int else { return }
                print("Response:", expectedStatus)
                status = expectedStatus
                patientId = createdPatientId
            }
            semaphore.signal()
        }
        
        task.resume()
        semaphore.wait()
        
        return (status!, patientId!)
    }
}
