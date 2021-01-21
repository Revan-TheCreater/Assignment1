//
//  EditViewController.swift
//  lecture3DemoSimpleApp
//
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet weak var itemText: UITextField!
    @IBOutlet weak var editButton: UIButton!
    var editCallback: ((_ itemText: String) -> ())?
    var oldText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemText.text = oldText
    }
    
    
    @IBAction func editItem(_ sender: Any) {
        guard let text = itemText.text, text != "" else {
            navigationController?.popViewController(animated: true)
            return
        }
        navigationController?.popViewController(animated: true)
    }


}
