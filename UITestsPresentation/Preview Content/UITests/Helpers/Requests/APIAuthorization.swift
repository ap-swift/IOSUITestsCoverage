import Foundation

private typealias apiConfig = APIConfig

class ApiAuthorization {
    
    func fetchSms(token: String = "Bearer Developer UserRole:users-admin",forPhone phone: String) -> String {
        let PREPROD_ADMIN_SMS_URL = apiConfig.mainUrl + "/admin-preprod/Users/UsersAdminService/GetLastActiveSms"
        let codeData = ["phone": "7\(phone)"]
        
        var codeRequest = URLRequest(url: URL(string: PREPROD_ADMIN_SMS_URL)!)
        codeRequest.httpMethod = "POST"
        codeRequest.addValue("2.2.0", forHTTPHeaderField: "Application-Version")
        codeRequest.addValue(token, forHTTPHeaderField: "Authorization")
        codeRequest.addValue(apiConfig.contentType, forHTTPHeaderField: "Content-Type")
        codeRequest.httpBody = try? JSONSerialization.data(withJSONObject: codeData)
        
        var code: String?
        let semaphore = DispatchSemaphore(value: 0)
        
        let codeTask = URLSession.shared.dataTask(with: codeRequest) { (data, response, error) in
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                  let smsInfo = json["smsInfo"] as? [String: Any],
                  let smsCode = smsInfo["smsCode"] as? String else {
                semaphore.signal()
                return
            }
            code = smsCode
            semaphore.signal()
        }
        codeTask.resume()
        semaphore.wait()
        
        guard let code = code else { return "Error: \(String(describing: code))" }
        
        return code
    }
    
    func getUserId(token: String = "Bearer Developer UserRole:users-admin",forPhone phone: String) -> String {
        let urlString = apiConfig.mainUrl + "/gateway-preprod/api/users/info/v3"
        
        var codeRequest = URLRequest(url: URL(string: urlString)!)
        codeRequest.httpMethod = "GET"
        codeRequest.addValue("2.2.0", forHTTPHeaderField: "Application-Version")
        codeRequest.addValue(token, forHTTPHeaderField: "Authorization")
        codeRequest.addValue(apiConfig.contentType, forHTTPHeaderField: "Content-Type")
        codeRequest.httpBody = try? JSONSerialization.data(withJSONObject: phone)
        
        var userId: String?
        let semaphore = DispatchSemaphore(value: 0)
        
        let codeTask = URLSession.shared.dataTask(with: codeRequest) { (data, response, error) in
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                  let body = json["data"] as? [String: Any],
                  let user = body["userId"] as? String else {
                semaphore.signal()
                return
            }
            userId = user
            semaphore.signal()
        }
        codeTask.resume()
        semaphore.wait()
        
        guard let userId = userId else { return "Error: \(String(describing: userId))" }
        
        return userId
    }
    
    func createNewUser(user: User, smsCode: String?) -> Int {
        let urlString = apiConfig.mainUrl + "/gateway-preprod/api/users/create/v4"
        
        var codeData: [String : Any] = ["phone": "7\(user.phoneNumber)", "password": user.password, "termsOfUse": [["code": 1, "value": true]] as [[String : Any]]]
        
        var request = URLRequest(url: URL(string: urlString)!)
        request.httpMethod = "POST"
        request.addValue(apiConfig.contentType, forHTTPHeaderField: "Content-Type")
        request.addValue(apiConfig.deviceToken, forHTTPHeaderField: "Device-Token")
        request.addValue(apiConfig.OSType, forHTTPHeaderField: "Os-Type")
        request.addValue(apiConfig.OSVersion, forHTTPHeaderField: "Os-Version")
        request.addValue(apiConfig.userAgent, forHTTPHeaderField: "User-Agent")
        request.addValue(apiConfig.applicationVersion, forHTTPHeaderField: "Application-Version")
        
        if let smsCode = smsCode {
            codeData["smsCode"] = smsCode
        }
        request.httpBody = try? JSONSerialization.data(withJSONObject: codeData, options: [] )
        
        var status: String?
        var userID: Int?
        let semaphore = DispatchSemaphore(value: 0)
        
        let codeTask = URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data,
                  let json = try? JSONSerialization.jsonObject(with: data) as? [String: Any],
                  let body = json["statusInfo"] as? [String: Any],
                  let userStatus = body["status"] as? String,
                  let infoMessages = body["infoMessages"] as? [[String: Any]],
                  let descr = infoMessages[0]["descr"] as? String else {
                let json = try? JSONSerialization.jsonObject(with: data!) as? [String: Any]
                print(json)
                return
            }
            
            if smsCode != nil {
                guard let dataInfo = json["data"] as? [String: Any],
                      // можно достать token и refreshtoken
                      let userIDnumber = dataInfo["userId"] as? Int else { return }
                userID = userIDnumber
            }
            
            status = userStatus
            semaphore.signal()
        }
        
        codeTask.resume()
        semaphore.wait()
        
        guard status == "SUCCESS" else { preconditionFailure("") }
        guard let userID = userID else { return 1 }
        print(userID)
        return userID
    }
    
    func deleteUser(user: User) {
        
    }
}
