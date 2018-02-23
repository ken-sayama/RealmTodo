//
//  CreateTodoViewController.swift
//  RealmTodo
//
//  Created by 佐山絢 on 2018/02/23.
//  Copyright © 2018年 佐山絢. All rights reserved.
//

import UIKit
import RealmSwift

class CreateTodoViewController: UIViewController, UITextFieldDelegate {
    
    var textArea: UITextField!
    var label: UILabel!
    var btn: UIButton!
    
    // Realm
    let realm = try!Realm()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationItem.title = "Add Todo"
        
        // フレーム
        let frameWidth = self.view.frame.width
        let frameHeight = self.view.frame.height

        // label
        label = UILabel(frame: CGRect(x: frameWidth / 4, y: frameHeight / 2 - 100, width: 220, height: 50))
        label.text = "What do you have todo ?"
        label.font = UIFont.systemFont(ofSize: 20)
        label.textAlignment = .center
        self.view.addSubview(label)

        // textField
        //let textArea = UITextField(frame: CGRect(x: frameWidth / 4 , y: frameHeight / 2 - 50, width: 220, height: 50))
        textArea = UITextField(frame: CGRect(x: frameWidth / 4 , y: frameHeight / 2 - 50, width: 220, height: 50))
        textArea.placeholder = "Write about your todo"
        textArea.layer.borderWidth = 1.0
        textArea.layer.borderColor = UIColor.gray.cgColor
        textArea.leftViewMode = .always
        textArea.delegate = self
        textArea.text = ""
        textArea.leftView = UIView(frame: CGRect(x:0,y:0,width:10,height:10))
        self.view.addSubview(textArea)

        // button
        btn = UIButton(frame: CGRect(x: frameWidth / 4,y: frameHeight / 2 + 20, width: 220, height: 50))
        btn.setTitle("Add", for: .normal)
        btn.setTitleColor(UIColor.white, for: .normal)
        btn.backgroundColor = UIColor.black
        btn.layer.cornerRadius = 25
        btn.addTarget(self, action: #selector(self.addTodoAction(sender:)), for: .touchUpInside)
        self.view.addSubview(btn)
        
    }
    
    // ボタンクリック時の処理
    @objc func addTodoAction(sender: UITextField) {
        var inputText: String = textArea.text!
        print(inputText)
        inputText = ""
        
        let todo = Todo()
        todo.name = textArea.text!
        try!realm.write {
            realm.add(todo)
        }
        
        let controller = TodoTableViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
}
