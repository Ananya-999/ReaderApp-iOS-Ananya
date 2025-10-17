import UIKit

class ArticleCell: UITableViewCell {
    let titleLabel = UILabel()
    let authorLabel = UILabel()
    let thumbImageView = UIImageView()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        thumbImageView.translatesAutoresizingMaskIntoConstraints = false
        thumbImageView.contentMode = .scaleAspectFill
        thumbImageView.clipsToBounds = true

        titleLabel.font = .boldSystemFont(ofSize: 16)
        authorLabel.font = .systemFont(ofSize: 12)
        authorLabel.textColor = .gray
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        authorLabel.translatesAutoresizingMaskIntoConstraints = false

        contentView.addSubview(thumbImageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(authorLabel)

        NSLayoutConstraint.activate([
            thumbImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
            thumbImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            thumbImageView.widthAnchor.constraint(equalToConstant: 80),
            thumbImageView.heightAnchor.constraint(equalToConstant: 60),

            titleLabel.leadingAnchor.constraint(equalTo: thumbImageView.trailingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),

            authorLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4)
        ])
    }

    required init?(coder: NSCoder) { fatalError() }

    func configure(with article: Article) {
        titleLabel.text = article.title
        authorLabel.text = article.author ?? "Unknown"
        if let imgUrl = article.urlToImage, let url = URL(string: imgUrl) {
            URLSession.shared.dataTask(with: url) { data, _, _ in
                guard let data = data else { return }
                DispatchQueue.main.async { self.thumbImageView.image = UIImage(data: data) }
            }.resume()
        }
    }
}
