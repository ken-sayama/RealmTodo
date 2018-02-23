//
//  Todo.swift
//  RealmTodo
//
//  Created by 佐山絢 on 2018/02/23.
//  Copyright © 2018年 佐山絢. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: - Model
class Todo: Object {
    @objc dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var created_at = Date()
    
    override static func primaryKey() -> String? {
        return "id"
    }
}


