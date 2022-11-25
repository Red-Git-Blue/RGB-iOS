import Foundation

struct SignRequest: ModelType {
    var email: String
    var password: String
    var name: String
}

struct LoginRequest: ModelType {
    var email: String
    var password: String
}
