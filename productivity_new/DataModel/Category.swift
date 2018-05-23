//
//  Category.swift
//  productivity_new
//
//  Created by MoHapX on 23.05.2018.
//  Copyright © 2018 MoHapX. All rights reserved.
//

import Foundation
import RealmSwift


class Category: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var desc: String = ""
    @objc dynamic var image: String = ""
    let items = List<Item>()
}
