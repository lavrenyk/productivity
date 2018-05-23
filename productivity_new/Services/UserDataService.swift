//
//  UserDataService.swift
//  productivity_new
//
//  Created by MoHapX on 23.05.2018.
//  Copyright © 2018 MoHapX. All rights reserved.
//

import Foundation
import RealmSwift

class UserDataService {
    
    static let instance = UserDataService()
    let realm = try! Realm()
    
    public private(set) var categoryList: Results<Category>?
    public private(set) var todoItems: Results<Item>?
    public private(set) var selectedCategory: Category?
    public private(set) var selectedItem: Item?
    public private(set) var selectedItemRow: Int = -1
    
    func loadCategoryList() {
        categoryList = realm.objects(Category.self)
    }
    
    func setSelectedCategory(index: Int) {
        selectedCategory = categoryList?[index]
    }
    
    func loadItems(category: Category) {
        if selectedCategory != nil {
            todoItems = selectedCategory?.items.sorted(byKeyPath: "title", ascending: true)
        }
    }
    
    func saveCategory(category: Category) {
        do {
            try realm.write {
                realm.add(category)
            }
        } catch {
            print("Error saving category, \(error)")
        }
    }
    
}
