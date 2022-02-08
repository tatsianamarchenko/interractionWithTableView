//
//  Model.swift
//  SecondProject
//
//  Created by Tatsiana Marchanka on 8.02.22.
//

import Foundation
import UIKit

struct Model {
  var image : UIImage
  var title : String
  var descriprion : String
  init(image: UIImage, title: String, description: String) {
    self.image = image
    self.title = title
    self.descriprion = description
  }
}
extension Model: Hashable {
  static func == (lhs: Model, rhs: Model) -> Bool {
    true
  }
}
