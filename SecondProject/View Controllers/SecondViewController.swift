//
//  SecondViewController.swift
//  SecondProject
//
//  Created by Tatsiana Marchanka on 8.02.22.
//

import UIKit

class SecondViewController: UIViewController {
  
  private lazy var imageSecond : UIImageView = {
    var image = UIImageView()
    image.layoutSubviews()
    image.translatesAutoresizingMaskIntoConstraints = false
    image.backgroundColor = .systemGray3
    image.contentMode = .scaleAspectFit
    return image
  }()
  
  private lazy var titleSecond : UILabel = {
    var title = UILabel()
    title.translatesAutoresizingMaskIntoConstraints = false
    title.font = UIFont.systemFont(ofSize: 30)
    title.textColor = .label
    return title
  }()
  
  private lazy var descripSecond : UILabel = {
    var descrip = UILabel()
    descrip.translatesAutoresizingMaskIntoConstraints = false
    descrip.font = UIFont.systemFont(ofSize: 20)
    descrip.textAlignment = .center
    descrip.textColor = .secondaryLabel
    return descrip
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    
    navigationBarConfig()
    
    let stack = UIStackView(arrangedSubviews: [imageSecond, titleSecond, descripSecond])
    stack.translatesAutoresizingMaskIntoConstraints = false
    stack.axis = .vertical
    stack.alignment = .center
    view.addSubview(stack)
    
    NSLayoutConstraint.activate([
      stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      stack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      imageSecond.widthAnchor.constraint(equalToConstant: imageSecond.intrinsicContentSize.width*2),
      imageSecond.heightAnchor.constraint(equalToConstant: imageSecond.intrinsicContentSize.height*2)
    ])
  }
  
  private func navigationBarConfig() {
    let appearance = UINavigationBarAppearance()
    appearance.configureWithOpaqueBackground()
    appearance.backgroundColor = UIColor.systemGray3
    navigationItem.standardAppearance = appearance
    navigationItem.scrollEdgeAppearance = appearance
    navigationItem.compactAppearance = appearance
    
    navigationItem.leftBarButtonItem =  UIBarButtonItem(image: UIImage(systemName: "arrowshape.turn.up.backward.2.fill")?.withTintColor(.label, renderingMode: .alwaysOriginal), style: .plain, target: self, action: #selector(popVC))
    
    navigationController?.navigationBar.isHidden = false
    navigationController?.navigationBar.prefersLargeTitles = true
  }
  
  @objc func popVC() {
    navigationController?.popViewController(animated: true)
  }
  
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    imageSecond.clipsToBounds = true
    imageSecond.layer.cornerRadius = imageSecond.intrinsicContentSize.width
  }
  
  init(imageItem : UIImage, titleItem : String, descriptionItem : String) {
    super.init(nibName: nil, bundle: nil)
    imageSecond.image = imageItem
    titleSecond.text = titleItem
    descripSecond.text = descriptionItem
    self.title = titleItem
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
