//
//  ViewController.swift
//  SecondProject
//
//  Created by Tatsiana Marchanka on 8.02.22.
//

import UIKit

import UIKit

class ViewController: UIViewController {
  var modelArray = [Model]()
  var imagesArray = [UIImage(named: "1"), UIImage(named: "2"), UIImage(named: "3"), UIImage(named: "4"), UIImage(named: "5"), UIImage(named: "6"), UIImage(named: "7"), UIImage(named: "8"), UIImage(named: "9"), UIImage(named: "10")]

  let table : UITableView = {
    let table = UITableView()
    table.register(Cell.self, forCellReuseIdentifier: Cell.cellIdentifier)
    table.translatesAutoresizingMaskIntoConstraints = false
    return table
  }()

  override func viewDidLoad() {

    super.viewDidLoad()

    var sourceArray = [UIImage]()
    for _ in 0...101 {
      let img1 = UIImage(named: "1")
      if let img1 = img1 { sourceArray.append(img1)}
      let img2 = UIImage(named: "2")
      if let img2 = img2 { sourceArray.append(img2)}
      let img3 = UIImage(named: "3")
      if let img3 = img3 { sourceArray.append(img3)}
      let img4 = UIImage(named: "4")
      if let img4 = img4 { sourceArray.append(img4)}
      let img5 = UIImage(named: "5")
      if let img5 = img5 { sourceArray.append(img5)}
      let img6 = UIImage(named: "6")
      if let img6 = img6 { sourceArray.append(img6)}
      let img7 = UIImage(named: "7")
      if let img7 = img7 { sourceArray.append(img7)}
      let img8 = UIImage(named: "8")
      if let img8 = img8 { sourceArray.append(img8)}
      let img9 = UIImage(named: "9")
      if let img9 = img9 { sourceArray.append(img9)}
      let img10 = UIImage(named: "10")
      if let img10 = img10 { sourceArray.append(img10)}

    }

    for i in 1...1000 {
      let image = sourceArray[i]
      modelArray.append(Model(image: image, title: "Title \(i)", description: "Discription \(i)"))
    }

    view.backgroundColor = .systemBackground
    table.dataSource = self
    table.delegate = self

    view.addSubview(table)

    NSLayoutConstraint.activate([
      table.widthAnchor.constraint(equalTo: view.widthAnchor),
      table.heightAnchor.constraint(equalTo: view.heightAnchor),
    ])
  }
}

extension  ViewController: UITableViewDelegate, UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return modelArray.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = table.dequeueReusableCell(withIdentifier: Cell.cellIdentifier, for: indexPath) as! Cell
    cell.descrip.text = modelArray[indexPath.row].descriprion
    cell.title.text = modelArray[indexPath.row].title
    cell.image.image = modelArray[indexPath.row].image

    return cell
  }
}
