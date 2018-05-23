//
//  CategoryCell.swift
//  productivity_new
//
//  Created by MoHapX on 22.05.2018.
//  Copyright © 2018 MoHapX. All rights reserved.
//

import UIKit
import SwipeCellKit

class CategoryCell:  SwipeTableViewCell  {
    
    // Outlets
    @IBOutlet weak var categorySelectFlag: UIButton!
    @IBOutlet weak var categoryBtn: UIButton!
    @IBOutlet weak var categoryLbl: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        if selected {
            self.categorySelectFlag.isHidden = false
        } else {
            self.categorySelectFlag.isHidden = true
        }

    }
    
    
}

//extension CategoryVC: UITableViewDataSource, UITableViewDelegate, SwipeTableViewCellDelegate {
//    
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 3
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as? CategoryCell else {return UITableViewCell()}
//        cell.delegate = self
//        cell.textLabel?.text = "Test cell"
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath, for orientation: SwipeActionsOrientation) -> [SwipeAction]? {
//        //        guard orientation == .right else { return nil }
//        
//        if orientation == .left {
//            
//            let stat = SwipeAction(style: .default, title: "Stat") { action, indexPath in
//                print("Stat action clicked!")
//            }
//            stat.hidesWhenSelected = true
//            configureSwipeActions(action: stat, with: .stat)
//            
//            return [stat]
//        } else {
//            let edit = SwipeAction(style: .default, title: "More") { action, indexPath in return }
//            edit.transitionDelegate = ScaleTransition.default
//            edit.hidesWhenSelected = true
//            configureSwipeActions(action: edit, with: .edit)
//            
//            let deleteAction = SwipeAction(style: .destructive, title: "Delete") { action, indexPath in
//                print("Delete action clicked!")
//            }
//            
//            // customize the action appearance
//            //            deleteAction.image = UIImage(named: "delete-icon")
//            
//            return [deleteAction, edit]
//        }
//    }
//    
//    func configureSwipeActions(action: SwipeAction, with descriptor: ActionDescriptor) {
//        action.title = descriptor.title()
//        action.backgroundColor = descriptor.color
//    }
//    
//}
//
//enum ActionDescriptor {
//    case stat, edit, delete
//    
//    func title() -> String? {
//        switch self {
//        case .stat: return "Stat"
//        case .edit: return "Edit"
//        case .delete: return "Delete"
//        }
//    }
//    
//    var color: UIColor {
//        switch self {
//        case .stat: return #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)
//        case .edit: return #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
//        case .delete: return #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
//        }
//    }
//}



















