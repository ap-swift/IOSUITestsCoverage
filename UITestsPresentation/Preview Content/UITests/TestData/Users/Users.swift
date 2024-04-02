protocol User {
    var phoneNumber: String { get }
    var password: String { get }
    var surname: String { get }
    var name: String { get }
    var lastname: String { get }
    var ID: String { get set }
    var email: String { get set }
    var address: String { get set }
    var day: String { get set }
    var month: String { get set }
    var year: String { get set }
}

struct Users {
    private init() {}
    
    static let shared = Users()
    
    func createUser(type: UsersList) -> User {
        switch type {
        case .main:
            return MainUser()
        case .empty:
            return EmptyUser()
        case .new:
            return NewUser()
        case .broken:
            return BrokenUser()
        }
    }
}

enum UsersList {
    case main
    case empty
    case new
    case broken
}

struct MainUser: User {
    let phoneNumber = "9778874392"
    let password = "11111111"
    var surname: String = "Стопкина"
    var name: String = "Марина"
    var lastname: String = "Бокалович"
    var ID = "588318"
    var email = ""
    var address = ""
    var day = "01"
    var month = "01"
    var year = "1999"
}

struct EmptyUser: User {
    let phoneNumber = "9633215142"
    let password = "11111111"
    var surname: String = "Хасбик"
    var name: String = "Хабиб"
    var lastname: String = "Хасбикович"
    var ID = "1000044"
    var email = ""
    var address = ""
    var day = ""
    var month = ""
    var year = ""
}

struct NewUser: User {
    let phoneNumber = "7001231224"
    let password = "11111111"
    let surname = String((0..<7).map{ _ in "абвгдежзийклмнопрс".randomElement()! })
    let name = String((0..<7).map{ _ in "абвгдежзийклмнопрс".randomElement()! })
    let lastname = String((0..<7).map{ _ in "абвгдежзийклмнопрс".randomElement()! })
    var ID = ""
    var email = "test@test.com"
    var address = String((0..<7).map{ _ in "абвгдежзийклмнопрс".randomElement()! })
    var day = "24"
    var month = "Декабря"
    var year = "1995"
}

struct BrokenUser: User {
    let phoneNumber = ""
    let password = "12345678"
    let surname = ""
    let name = ""
    let lastname = ""
    var ID = ""
    var email = ""
    var address = ""
    var day = ""
    var month = ""
    var year = ""
}
