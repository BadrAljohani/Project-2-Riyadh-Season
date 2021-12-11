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
    @IBOutlet weak var imageEvent: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    
}
