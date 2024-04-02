import XCTest

final class UITestEnvConfig {
    static let defaultContinueAfterFailure: Bool = false

    // Timeout
    static let timeout: TimeInterval = 8.0
    static let flakyTimeout: TimeInterval = 15.0

    // Localisation and language
    static let language_ru: String = "(ru)"
    static let locale_ru: String = "ru_RU"

    static let language_eng: String = "(es)"
    static let locale_eng: String = "en_ES"
}
