//
//  SecondViewController.swift
//  SecondProject
//
//  Created by Tatsiana Marchanka on 8.02.22.
//

import UIKit

class SecondViewController: UIViewController {

  private let image : UIImageView = {
    var image = UIImageView()
    image.layoutSubviews()
    image.translatesAutoresizingMaskIntoConstraints = false
    image.backgroundColor = .systemGray3
    image.contentMode = .scaleAspectFit
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

    navigationBarConfig()

    let stack = UIStackView(arrangedSubviews: [image, descrip])
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    stack.alignment = .center
    view.addSubview(stack)
    
    NSLayoutConstraint.activate([
      stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      image.widthAnchor.constraint(equalToConstant: image.intrinsicContentSize.width*2),
      image.heightAnchor.constraint(equalToConstant: image.intrinsicContentSize.height*2)
    ])
  }

  func navigationBarConfig() {
    title = "Description"

    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = UIColor.systemGray3
    appearance.titleTextAttributes = [.foregroundColor: UIColor.systemBackground]
    navigationItem.standardAppearance = appearance
    navigationItem.scrollEdgeAppearance = appearance
    navigationItem.compactAppearance = appearance

    navigationController?.navigationBar.isHidden = false
    navigationController?.navigationBar.prefersLargeTitles = true
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    image.clipsToBounds = true
    image.layer.cornerRadius = image.intrinsicContentSize.width
  }
  
  init(imageItem : UIImage, descriptionItem : String) {
    image.image = imageItem
    descrip.text = descriptionItem
    super.init(nibName: nil, bundle: nil)
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
