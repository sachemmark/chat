//
//  ThemesViewController.swift
//  Chat
//
//  Created by Mark Yankovsky on 10/14/18.
//  Copyright © 2018 Mark Yankovsky. All rights reserved.
//

import Foundation
import UIKit


class ThemesViewController: UIViewController {
    
    @IBOutlet weak var themeButton1: UIButton!
    @IBOutlet weak var themeButton2: UIButton!
    @IBOutlet weak var themeButton3: UIButton!

    @objc func setTheme(sender: AnyObject) {
        
        switch sender.tag {
        case 1:
            self.navigationController?.navigationBar.barTintColor = Themes.theme1.0
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Themes.theme1.1]
            UIApplication.shared.statusBarStyle = Themes.theme1.2
            self.view.backgroundColor = Themes.theme1.0
            UserDefaults.standard.set(1, forKey: "theme")
        case 2:
            self.navigationController?.navigationBar.barTintColor = Themes.theme2.0
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Themes.theme2.1]
            UIApplication.shared.statusBarStyle = Themes.theme2.2
            self.view.backgroundColor = Themes.theme2.0
            UserDefaults.standard.set(2, forKey: "theme")
        case 3:
            self.navigationController?.navigationBar.barTintColor = Themes.theme3.0
            self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: Themes.theme3.1]
            UIApplication.shared.statusBarStyle = Themes.theme3.2
            self.view.backgroundColor = Themes.theme3.0
            UserDefaults.standard.set(3, forKey: "theme")
        default:
            break
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.yellow
        
        themeButton1.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        themeButton1.tag = 1
        themeButton1.addTarget(self, action: #selector(ThemesViewController.setTheme(sender:)), for: .touchUpInside)
        themeButton2.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        themeButton2.tag = 2
        themeButton2.addTarget(self, action: #selector(ThemesViewController.setTheme(sender:)), for: .touchUpInside)
        themeButton3.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.8)
        themeButton3.tag = 3
        themeButton3.addTarget(self, action: #selector(ThemesViewController.setTheme(sender:)), for: .touchUpInside)
        
    }
    
}
