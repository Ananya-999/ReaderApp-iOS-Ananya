import Foundation

class APIService {
    func fetchNews(completion: @escaping ([Article]) -> Void) {
        guard let url = URL(string: Constants.baseURL) else { completion([]); return }
        URLSession.shared.dataTask(with: url) { data, _, _ in
            guard let data = data else { completion([]); return }
            let decoded = try? JSONDecoder().decode(NewsResponse.self, from: data)
            DispatchQueue.main.async { completion(decoded?.articles ?? []) }
        }.resume()
    }
}

struct NewsResponse: Codable {
    let articles: [Article]
}

