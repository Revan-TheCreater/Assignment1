//
//  AddViewController.swift
//  lecture3DemoSimpleApp
//
// 
//

import UIKit

class AddViewController: UIViewController {
    @IBOutlet weak var itemText: UITextField!
    
    var delegate: SecondViewControllerDelegate?
    var addCallback: ((_ item: ToDoItem)->())?
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    

    @IBAction func addItem(_ sender: Any) {
        
        guard let text = itemText.text, text != "" else {
            addCallback?(ToDoItem(id: -1, title: "Empty Title", subTitle: "Empty", isActive: false))
            navigationController?.popViewController(animated: true)
            return
        }
        addCallback?(ToDoItem(id: delegate?.getCounterId(), title: text, subTitle: "Empty", isActive: false))
        navigationController?.popViewController(animated: true)
    }


}
