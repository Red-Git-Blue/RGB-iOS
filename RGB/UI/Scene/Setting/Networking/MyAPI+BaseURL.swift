import Foundation

extension MyAPI {
  func getBaseURL() -> URL {
    return URL(string: "http://local.lite24.net:8080/api/rgb/v1")!
  }
}
