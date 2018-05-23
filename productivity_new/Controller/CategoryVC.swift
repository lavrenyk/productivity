//
//  ViewController.swift
//  productivity_new
//
//  Created by MoHapX on 22.05.2018.
//  Copyright © 2018 MoHapX. All rights reserved.
//

import UIKit
import SwipeCellKit

class CategoryVC: UIViewController {
    
    //Outlets
    @IBOutlet weak var tableView: UITableView!
    
    override var prefersStatusBarHidden: Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tabBarItem.isEnabled = false
        
        UserDataService.instance.loadCategoryList()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UserDataService.instance.loadCategoryList()
        if UserDataService.instance.selectedCategory == nil {
            if UserDataService.instance.categoryList != nil {
                UserDataService.instance.setSelectedCategory(index: 0)
            }
        }
    }


}

extension CategoryVC: UITableViewDataSource, UITableViewDelegate, SwipeTableViewCellDelegate {

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (UserDataService.instance.categoryList?.count)!
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as? CategoryCell else {return UITableViewCell()}
                
        cell.delegate = self
        cell.categoryLbl.text = UserDataService.instance.categoryList![indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        UserDataService.instance.setSelectedCategory(index: indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
        
        if orientation == .left {

            let stat = SwipeAction(style: .default, title: "Stat") { action, indexPath in
                print("Stat action clicked!")
            }
            stat.hidesWhenSelected = true
            configureSwipeActions(action: stat, with: .stat)

            return [stat]
        } else {
            let edit = SwipeAction(style: .default, title: "edit") { action, indexPath in return }
            edit.transitionDelegate = ScaleTransition.default
            edit.hidesWhenSelected = true
            configureSwipeActions(action: edit, with: .edit)

            let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
                print("Delete action clicked!")
            }
            
            deleteAction.image = UIImage(named: "delete")

            return [deleteAction, edit]
        }
    }
    
    
    func configureSwipeActions(action: SwipeAction, with descriptor: ActionDescriptor) {
        action.title = descriptor.title()
        action.backgroundColor = descriptor.color
    }
}

enum ActionDescriptor {
    case stat, edit, delete

    func title() -> String? {
        switch self {
        case .stat: return "Stat"
        case .edit: return "Edit"
        case .delete: return "Trash"
        }
    }

    var color: UIColor {
        switch self {
        case .stat: return #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
        case .edit: return #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        case .delete: return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        }
    }
}

