//
//  AddController.swift
//  MyToDo
//
//  Created by 濱貴大 on 2020/11/14.
//

import UIKit
import RealmSwift

class ToDo: Object {
    dynamic var title = ""
}


var todoList = [String]()



class AddController: UIViewController {
    
    
    //テキストフィールドの設定
    @IBOutlet weak var TextField: UITextField!
    
   
    
    //追加ボタンの設定

    @IBAction func TodoAddButton(_ sender: Any) {
   
        
        //変数に入力内容を入れる
        todoList.append(TextField.text!)
        //追加ボタンを押したらフィールドを空にする
        TextField.text = ""
        //変数の中身をUDに追加
        UserDefaults.standard.set( todoList, forKey: "TodoList" )
        
    
        
        
        
    }
// スクロールしない
    

        
        func textViewDidChange(_ textView: UITextView) {
                //新しいテキスト
       
            
            
            }
        
        

    }
    
    


