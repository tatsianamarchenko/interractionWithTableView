//
//  SecondViewController.swift
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
    image.backgroundColor = .systemGray3
    image.contentMode = .scaleAspectFit
    image.layer.cornerRadius = 50
    image.clipsToBounds = true
    return image
  }()

  private let descrip : UILabel = {
    var descrip = UILabel()
    descrip.textAlignment = .center
    descrip.font = .systemFont(ofSize: 25)
    descrip.translatesAutoresizingMaskIntoConstraints = false
    return descrip
  }()

  var stack : UIStackView = {
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    stack.backgroundColor = .systemPink
    stack.distribution = .fill
    stack.alignment = .center
    return stack
  }()

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .systemBackground

    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "cancel", style: .done, target: self, action: #selector(cancel))

   let stack = UIStackView(arrangedSubviews: [image, descrip])
      stack.translatesAutoresizingMaskIntoConstraints = false
      stack.axis = .vertical
//      stack.distribution = .fill
      stack.alignment = .center
    view.addSubview(stack)

    NSLayoutConstraint.activate([
      stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      image.widthAnchor.constraint(equalToConstant: 96),
      image.heightAnchor.constraint(equalToConstant: 96),
    ])
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
