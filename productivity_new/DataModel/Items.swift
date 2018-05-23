//
//  Items.swift
//  productivity_new
//
//  Created by MoHapX on 23.05.2018.
//  Copyright © 2018 MoHapX. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var desc: String = ""
    @objc dynamic var dateCreated: Date?
    @objc dynamic var dueDate: Date?
    @objc dynamic var planCount: Int = 0
    @objc dynamic var currentCount: Int = 0
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
