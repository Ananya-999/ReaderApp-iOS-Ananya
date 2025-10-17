import Foundation

class NewsViewModel {
    var articles: [Article] = []
    var filteredArticles: [Article] = []

    let api = APIService()

    func fetch(completion: @escaping () -> Void) {
        api.fetchNews { [weak self] data in
            self?.articles = data
            self?.filteredArticles = data
            completion()
        }
    }

    func search(_ text: String) {
        if text.isEmpty { filteredArticles = articles }
        else { filteredArticles = articles.filter { $0.title.lowercased().contains(text.lowercased()) } }
    }
}
