//
//  MessageCell.swift
//  Chat
//
//  Created by Mark Yankovsky on 10/10/18.
//  Copyright © 2018 Mark Yankovsky. All rights reserved.
//

import UIKit

protocol MessageCellConfiguration : class {
    var messageText: String? {get set}
}

class MessageCell: UITableViewCell, MessageCellConfiguration {
    var messageText: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
