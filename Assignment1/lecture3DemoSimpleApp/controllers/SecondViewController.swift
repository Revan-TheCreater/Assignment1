//
//  SecondViewController.swift
//  lecture3DemoSimpleApp
//
// 
//

import UIKit

protocol SecondViewControllerDelegate {
    func getCounterId() -> Int
}

class SecondViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var arr = [ToDoItem]()
    let cellId = "TableViewCell"
    var id = 0
   
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main page"
        self.configureTableView()
    }
    
    func configureTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: cellId, bundle: nil), forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
    }
    
    @IBAction func add(_ sender: UIBarButtonItem) {
        let vc = storyboard?.instantiateViewController(identifier: "AddViewController") as! AddViewController
        vc.delegate = self
        vc.addCallback = {item in
            self.arr.append(item)
            self.id += 1
            self.tableView.reloadData()
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension SecondViewController: SecondViewControllerDelegate{
    func getCounterId() -> Int {
        return id
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource{

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell
        let item = arr[indexPath.row]
        cell.id = item.id ?? 0
        cell.titleLabel.text = item.title
        arr[indexPath.row].isActive = cell.isDone
        cell.subTitleLabel.text = item.subTitle
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let vc = storyboard?.instantiateViewController(identifier: "EditViewController") as! EditViewController
        let edit = UIContextualAction(style: .normal, title: "Edit") {
            [weak self] (action, view, completionHandler) in
            vc.oldText = self?.arr[indexPath.row].title ?? ""
            vc.editCallback = { itemText in
                self?.arr[indexPath.row].title = itemText
            }
            self?.navigationController?.pushViewController(vc, animated: true)
            completionHandler(true)
        }
        edit.backgroundColor = .systemGray
        let delete = UIContextualAction(style: .destructive, title: "Delete") {
            [weak self] (action, view, completionHandler) in
            self?.arr.remove(at: indexPath.row)
            self?.tableView.deleteRows(at: [indexPath], with: .automatic)
            completionHandler(true)
        }
        delete.backgroundColor = .systemRed
        let conf = UISwipeActionsConfiguration(actions: [delete, edit])
        return conf
    }
    
}
