import Foundation

struct Article: Codable {
    let title: String
    let author: String?
    let urlToImage: String?
    let url: String
}
