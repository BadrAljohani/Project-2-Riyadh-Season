//
//  EventCell.swift
//  ReminderUItableview
//
//  Created by Badr on 25/03/1443 AH.
//

import UIKit

class EventCell: UITableViewCell {
    
    @IBOutlet weak var Time: UILabel!
    
    @IBOutlet weak var Title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
