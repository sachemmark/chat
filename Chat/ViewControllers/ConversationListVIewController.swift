//
//  ConversationListVIewController.swift
//  Chat
//
//  Created by Mark Yankovsky on 10/7/18.
//  Copyright © 2018 Mark Yankovsky. All rights reserved.
//

import Foundation
import UIKit


struct ConversationData {
    var name: String!
    var message: String!
    var date: Date!
    var online: Bool!
    var hasUnreadMessages: Bool!
}

class ConversationListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var navigationBar: UINavigationItem!
    @IBOutlet weak var tableView: UITableView!
    
    
    var selectedName: String = "Oleg Tinkov" // just default value
    
    var onlineConversations = [
        ConversationData(name: "Mark", message: "Hello", date: Date(timeIntervalSinceNow: -345), online: true, hasUnreadMessages: true),
        ConversationData(name: "Anton", message: "Good bye", date: Date(timeIntervalSinceNow: -23), online: true, hasUnreadMessages: true),
        ConversationData(name: "Anya", message: "Have a good day", date: Date(timeIntervalSinceNow: -3459), online: true, hasUnreadMessages: false),
        ConversationData(name: "Pavel", message: "Happy birthday", date: Date(timeIntervalSinceNow: -309), online: true, hasUnreadMessages: true),
        ConversationData(name: "Tanya", message: "Something", date: Date(timeIntervalSinceNow: -23423), online: true, hasUnreadMessages: true),
        ConversationData(name: "Max", message: "Something else", date: Date(timeIntervalSinceNow: -2534), online: true, hasUnreadMessages: true),
        ConversationData(name: "Gleb", message: nil, date: Date(timeIntervalSinceNow: -23434), online: true, hasUnreadMessages: false),
        ConversationData(name: "Sergey", message: nil, date: Date(timeIntervalSinceNow: -5903), online: true, hasUnreadMessages: false),
        ConversationData(name: "Kate", message: nil, date: Date(timeIntervalSinceNow: -353), online: true, hasUnreadMessages: false),
        ConversationData(name: "John", message: "Take care", date: Date(timeIntervalSinceNow: -49), online: true, hasUnreadMessages: false)]
    var offlineConversations = [
        ConversationData(name: "Brad", message: "Metallica", date: Date(timeIntervalSinceNow: -5234), online: false, hasUnreadMessages: true),
        ConversationData(name: "Helen", message: "Linkin Park", date: Date(timeIntervalSinceNow: -4534), online: false, hasUnreadMessages: false),
        ConversationData(name: "Alex", message: "Hello", date: Date(timeIntervalSinceNow: -909), online: false, hasUnreadMessages: true),
        ConversationData(name: "Petr", message: nil, date: Date(timeIntervalSinceNow: -235235235), online: false, hasUnreadMessages: false),
        ConversationData(name: "Olga", message: nil, date: Date(timeIntervalSinceNow: -35534), online: false, hasUnreadMessages: false),
        ConversationData(name: "Dima", message: nil, date: Date(timeIntervalSinceNow: -3423), online: false, hasUnreadMessages: false),
        ConversationData(name: "Zhenya", message: "Elon Musk", date: Date(timeIntervalSinceNow: -23525352), online: false, hasUnreadMessages: false),
        ConversationData(name: "Ilya", message: "London", date: Date(timeIntervalSinceNow: -569324894), online: false, hasUnreadMessages: true),
        ConversationData(name: "Emma", message: "See you", date: Date(timeIntervalSinceNow: -3456), online: false, hasUnreadMessages: false),
        ConversationData(name: "Julia", message: "Inception", date: Date(timeIntervalSinceNow: -123452), online: false, hasUnreadMessages: true)]
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return onlineConversations.count
        case 1:
            return offlineConversations.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ConversationCell", for: indexPath) as! ConversationCell
        
        if (indexPath.section == 0) {
            cell.configure(conversationData: onlineConversations[indexPath.row], width: self.view.frame.width)
        } else {
            cell.configure(conversationData: offlineConversations[indexPath.row], width: self.view.frame.width)
        }
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Online"
        case 1:
            return "History"
        default:
            return "Error"
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == 0) {
            selectedName = onlineConversations[indexPath.row].name
        } else {
            selectedName = offlineConversations[indexPath.row].name
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "ShowConversation", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "ShowConversation") {
            let destinationViewController = segue.destination
            destinationViewController.title = selectedName
        }
    }
    
    func logThemeCnahging(selectedTheme: UIColor) {
        print(selectedTheme)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.register(UINib(nibName: "ConversationCell", bundle: Bundle.main), forCellReuseIdentifier: "ConversationCell")
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        navigationBar.title = "Tinkoff Chat"
    }
    
}
