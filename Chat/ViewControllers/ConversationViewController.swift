//
//  ConversationViewController.swift
//  Chat
//
//  Created by Mark Yankovsky on 10/7/18.
//  Copyright © 2018 Mark Yankovsky. All rights reserved.
//

import Foundation
import UIKit



class ConversationViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var passedData: String = "Just a default value"
    
    @IBOutlet weak var tableView: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.row == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "IncomingMessageCell", for: indexPath) as! MessageCell
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "SentMessageCell", for: indexPath) as! MessageCell
            return cell
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

//        self.tableView.register(UINib(nibName: "IncomingMessageCell", bundle: Bundle.main), forCellReuseIdentifier: "IncomingMessageCell")
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.estimatedRowHeight = 100
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
}
