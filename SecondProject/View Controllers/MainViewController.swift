//
//  ViewController.swift
//  SecondProject
//
//  Created by Tatsiana Marchanka on 8.02.22.
//

import UIKit

class MainViewController: UIViewController {
  
  private var modelArray = [Model]()
  
  private lazy var table : UITableView = {
    let table = UITableView()
    table.register(Cell.self, forCellReuseIdentifier: Cell.cellIdentifier)
    table.translatesAutoresizingMaskIntoConstraints = false
    return table
  }()
  
  override func loadView() {
    super.loadView()
    filledModelArray()
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
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    navigationController?.navigationBar.isHidden = true
  }
  
  private func filledModelArray() {
    var sourceArray = [UIImage]()
    
    func addImageToArray (name: String) {
      let image = UIImage(named: name)
      if let image = image {
        sourceArray.append(image)
      }
    }
    
    for _ in 0...100 {
      addImageToArray(name: "1")
      addImageToArray(name: "2")
      addImageToArray(name: "3")
      addImageToArray(name: "4")
      addImageToArray(name: "5")
      addImageToArray(name: "6")
      addImageToArray(name: "7")
      addImageToArray(name: "8")
      addImageToArray(name: "9")
      addImageToArray(name: "10")
    }
    
    for i in 0..<1000 {
      let image = sourceArray[i]
      modelArray.append(Model(image: image, title: "Title \(i+1)", description: "Description \(i+1)"))
    }
  }
}

extension  MainViewController: UITableViewDelegate, UITableViewDataSource {
  
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
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 60
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let vc = SecondViewController(imageItem: modelArray[indexPath.row].image, titleItem: modelArray[indexPath.row].title, descriptionItem: modelArray[indexPath.row].descriprion)
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

extension MainViewController: UITableViewDragDelegate {
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
