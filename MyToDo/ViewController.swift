//
//  ViewController.swift
//  MyToDo
//
//  Created by 濱貴大 on 2020/11/10.
//

import UIKit

import RealmSwift

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    
   
 
    
    //UITableView、numberOfRowsInSectionの追加(表示するcell数を決める)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //戻り値の設定(表示するcell数)
        return todoList.count
        
        
       
        
        
    }
    
  
    
    
    
    //UITableView、cellForRowAtの追加(表示するcellの中身を決める)
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            //変数を作る
            let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
            //変数の中身を作る
            TodoCell.textLabel!.text = todoList[indexPath.row]
            //戻り値の設定（表示する中身)
            return TodoCell
            
            
            
            
        }
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
    
        
                //追加画面で入力した内容を取得する
                if UserDefaults.standard.object(forKey: "TodoList") != nil {
                    todoList = UserDefaults.standard.object(forKey: "TodoList") as! [String]
        
                    
              
                   
                
    }


}

    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          //アイテム削除の処理
        todoList.remove(at: indexPath.row)
          let indexPaths = [indexPath]
          tableView.deleteRows(at: indexPaths, with: .automatic)
        UserDefaults.standard.set( todoList, forKey: "TodoList" )
        
        
   
        
          }
    

    }





