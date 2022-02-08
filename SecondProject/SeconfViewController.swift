//
//  SeconfViewController.swift
//  SecondProject
//
//  Created by Tatsiana Marchanka on 8.02.22.
//

import UIKit

import UIKit

class SecondViewController: UIViewController {

  private let imageItem : UIImage
  private let descriptionItem : String

  private let image : UIImageView = {
    var image = UIImageView()
    image.layoutSubviews()
    image.translatesAutoresizingMaskIntoConstraints = false
//    image.backgroundColor = .systemGray3
    image.contentMode = .scaleAspectFill
    return image
  }()

  private let descrip : UILabel = {
    var descrip = UILabel()
    descrip.textAlignment = .center
    descrip.font = .systemFont(ofSize: 30)
    descrip.translatesAutoresizingMaskIntoConstraints = false
    return descrip
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .systemBackground

    let stack = UIStackView(arrangedSubviews: [image, descrip])
    stack.axis = .vertical
    stack.backgroundColor = .systemPink
    stack.distribution = .equalSpacing
    stack.alignment = .center
    stack.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(stack)

    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "cancel", style: .done, target: self, action: #selector(cancel))

    NSLayoutConstraint.activate([
      stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      image.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -300),
      image.heightAnchor.constraint(equalTo: view.widthAnchor, constant: -300),
      stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),

    ])
  }


  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
      image.layer.masksToBounds = true
    image.layer.cornerRadius = image.frame.size.height / 2
  }


  @objc func cancel () {
    dismiss(animated: true, completion: nil)
  }

  init(imageItem : UIImage, descriptionItem : String) {
    image.image = imageItem
    descrip.text = descriptionItem
    self.imageItem = imageItem
    self.descriptionItem = descriptionItem
    super.init(nibName: nil, bundle: nil)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
