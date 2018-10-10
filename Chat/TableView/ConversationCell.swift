//
//  ConversationCell.swift
//  Chat
//
//  Created by Mark Yankovsky on 10/7/18.
//  Copyright © 2018 Mark Yankovsky. All rights reserved.
//

import UIKit

protocol ConversationCellConfiguration: class {
    var name: String? {get set}
    var message: String? {get set}
    var date: String? {get set}
    var online: Bool {get set}
    var hasUnreadMessages: Bool {get set}
}

class ConversationCell: UITableViewCell, ConversationCellConfiguration {
    var name: String? = String()
    var message: String? = String()
    var date: String? = String()
    var online: Bool = Bool()
    var hasUnreadMessages: Bool = Bool()
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var messageLabel: UILabel!
    
    
    func configure(conversationData: ConversationData, width: CGFloat) {
        nameLabel.frame = CGRect(x: 8, y: 8, width: (width - 24) * 0.75, height: 22)
        nameLabel.textAlignment = .left
        
        timeLabel.frame = CGRect(x: nameLabel.frame.maxX + 8, y: 8, width: (width - 24) * 0.25, height: 20)
        timeLabel.textAlignment = .right
        
        messageLabel.frame = CGRect(x: 8, y: nameLabel.frame.maxY + 8, width: width - 16, height: 20)
        messageLabel.textAlignment = .left
        
        nameLabel.text = conversationData.name
        
        let dateFormatter = DateFormatter()
        if (!Calendar.current.isDateInToday(conversationData.date)) {
            dateFormatter.dateFormat = "dd/MM/yyyy" // I think it's better to show year aswell
            timeLabel.text = dateFormatter.string(from: conversationData.date)
        } else {
            dateFormatter.dateFormat = "HH:mm"
            timeLabel.text = dateFormatter.string(from: conversationData.date)
        }
        
        if (conversationData.online) {
            backgroundColor = UIColor(red: 1, green: 1, blue: 0, alpha: 0.05)
        } else {
            backgroundColor = UIColor.white
        }
        
        if (conversationData.hasUnreadMessages) {
            messageLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 17)
        } else {
            messageLabel.font = UIFont(name: "HelveticaNeue", size: 17)
        }
        
        if (conversationData.message != nil) {
            messageLabel.text = conversationData.message
        } else {
            messageLabel.text = "No messages yet"
            messageLabel.font = UIFont(name: "HelveticaNeue-Italic", size: 17)
        }
    }
    
}
