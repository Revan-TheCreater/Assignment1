//
//  TableViewCell.swift
//  lecture3DemoSimpleApp
//
//  Created by admin on 06.01.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var isDoneSwitch: UISwitch!
    
    var id = 0
    var isDone = false

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    @IBAction func changeState(_ sender: Any) {
        self.isDone = !isDone
        if titleLabel.textColor == .systemRed {
            return
        }
        if isDone {
            titleLabel.textColor = .systemGreen
        } else {
            titleLabel.textColor = .black
        }
        
    }
    
}
