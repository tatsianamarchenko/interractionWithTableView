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


  private var titleItem : UILabel = {
    var title = UILabel()
    title.translatesAutoresizingMaskIntoConstraints = false
    title.font = UIFont.systemFont(ofSize: 30)
    title.textColor = .label
    return title
  }()

  private var descrip : UILabel = {
    var descrip = UILabel()
    descrip.translatesAutoresizingMaskIntoConstraints = false
    descrip.font = UIFont.systemFont(ofSize: 20)
    descrip.textAlignment = .center
    descrip.textColor = .secondaryLabel
    return descrip
  }()
  
  private var stack : UIStackView = {
    let stack = UIStackView()
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    stack.distribution = .fill
    stack.alignment = .center
    return stack
  }()
  
  override func viewDidLoad() {
    
    super.viewDidLoad()
    view.backgroundColor = .systemBackground

    navigationBarConfig()

    let stack = UIStackView(arrangedSubviews: [image, titleItem, descrip])
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

  private func navigationBarConfig() {
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
  
  init(imageItem : UIImage, titleItem : String, descriptionItem : String) {
    self.image.image = imageItem
    self.titleItem.text = titleItem
    self.descrip.text = descriptionItem
    super.init(nibName: nil, bundle: nil)
    title = titleItem
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
