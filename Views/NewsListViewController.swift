import UIKit

class NewsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {
    let tableView = UITableView()
    let viewModel = NewsViewModel()
    let searchBar = UISearchBar()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "News"
        view.backgroundColor = .systemBackground

        tableView.frame = view.bounds
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)

        searchBar.delegate = self
        tableView.tableHeaderView = searchBar

        viewModel.fetch { [weak self] in
            self?.tableView.reloadData()
        }

        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refreshArticles), for: .valueChanged)
        tableView.refreshControl = refreshControl
    }

    @objc func refreshArticles() {
        viewModel.fetch { [weak self] in
            self?.tableView.reloadData()
            self?.tableView.refreshControl?.endRefreshing()
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredArticles.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? ArticleCell(style: .default, reuseIdentifier: "Cell")
        if let articleCell = cell as? ArticleCell {
            articleCell.configure(with: viewModel.filteredArticles[indexPath.row])
        }
        return cell
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(searchText)
        tableView.reloadData()
    }
}
