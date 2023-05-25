//
//  NotificationsController.swift
//  InstagramFirestroreTutorial
//
//  Created by escher on 2023/05/23.
//

import UIKit

class NotificationsController: UITableViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
    }
    
    // MARK: - Helpers
    
    func configureTableView() {
        view.backgroundColor = .white
    }
    
}
