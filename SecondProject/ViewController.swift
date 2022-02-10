//
//  ViewController.swift
//  SecondProject
//
//  Created by Tatsiana Marchanka on 8.02.22.
//

import UIKit

class ViewController: UIViewController {

  var modelArray = [Model]()

  let table : UITableView = {
    let table = UITableView()
    table.register(Cell.self, forCellReuseIdentifier: Cell.cellIdentifier)
    table.translatesAutoresizingMaskIntoConstraints = false
    return table
  }()

  override func loadView() {
    super.loadView()
    fillModelArray()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.isHidden = true
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    
    view.backgroundColor = .systemBackground
    view.addSubview(table)

    table.dragDelegate = self
    table.dragInteractionEnabled = true
    table.dataSource = self
    table.delegate = self

    NSLayoutConstraint.activate([
      table.widthAnchor.constraint(equalTo: view.widthAnchor),
      table.heightAnchor.constraint(equalTo: view.heightAnchor),
    ])
  }

  func fillModelArray() {
    var sourceArray = [UIImage]()
    for _ in 0...100 {
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

    for i in 0..<1000 {
      let image = sourceArray[i]
      modelArray.append(Model(image: image, title: "Title \(i+1)", description: "Description \(i+1)"))
    }
  }
}

extension  ViewController: UITableViewDelegate, UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return modelArray.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = table.dequeueReusableCell(withIdentifier: Cell.cellIdentifier, for: indexPath) as? Cell else {
      return UITableViewCell()
    }
    cell.config(model: modelArray[indexPath.row])
    return cell
  }

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let vc = SecondViewController(imageItem: modelArray[indexPath.row].image, descriptionItem: modelArray[indexPath.row].descriprion)
    navigationController?.pushViewController(vc, animated: true)
  }

  func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    .delete
  }

  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      modelArray.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
    }
  }
}

extension ViewController: UITableViewDragDelegate {
  func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
    let item = modelArray[indexPath.row]
    let itemProvider = NSItemProvider()
    let dragItem = UIDragItem(itemProvider: itemProvider)
    dragItem.localObject = item
    return [dragItem]
  }

  func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    guard sourceIndexPath != destinationIndexPath else {
      return
    }
    let item = modelArray[sourceIndexPath.row]
    if sourceIndexPath.row < destinationIndexPath.row {
      modelArray.insert(item, at: destinationIndexPath.row + 1)
      modelArray.remove(at: sourceIndexPath.row)
    } else {
      modelArray.remove(at: sourceIndexPath.row)
      modelArray.insert(item, at: destinationIndexPath.row)
    }
  }
}
