//
//  Cell.swift
//  SecondProject
//
//  Created by Tatsiana Marchanka on 8.02.22.
//

import UIKit

class Cell: UITableViewCell {

  var image : UIImageView = {
    var image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
    image.backgroundColor = .systemGray3
    image.contentMode = .scaleAspectFit
    return image
  }()

  var title : UILabel = {
    var title = UILabel()
    title.translatesAutoresizingMaskIntoConstraints = false
    title.font = UIFont.systemFont(ofSize: 20)
    title.textColor = .label
    return title
  }()

  var descrip : UILabel = {
    var descrip = UILabel()
    descrip.translatesAutoresizingMaskIntoConstraints = false
    descrip.font = UIFont.systemFont(ofSize: 18)
    descrip.textColor = .secondaryLabel
    return descrip
  }()

  static var cellIdentifier = "Cell"

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)

    contentView.addSubview(descrip)
    contentView.addSubview(image)
    contentView.addSubview(title)

    NSLayoutConstraint.activate([
      descrip.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20),
      descrip.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),

      title.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20),
      title.bottomAnchor.constraint(equalTo: descrip.topAnchor, constant: 3),
      title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),

      image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
      image.bottomAnchor.constraint(equalTo: descrip.bottomAnchor),
      image.topAnchor.constraint(equalTo: title.topAnchor),
    ])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    image.layer.masksToBounds = true
    image.layer.cornerRadius = image.frame.size.height / 2
  }
}

