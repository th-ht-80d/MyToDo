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
    
    @IBOutlet weak var NowDay: UILabel!
    
    let dt = Date()
        let dateFormatter = DateFormatter()
    
    //UITableView、cellForRowAtの追加(表示するcellの中身を決める)
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            //変数を作る
            let TodoCell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TodoCell", for: indexPath)
            //複数行でも入力可能
            TodoCell.textLabel?.numberOfLines=0
            //変数の中身を作る
            TodoCell.textLabel!.text = todoList[indexPath.row]
            //戻り値の設定（表示する中身)
            return TodoCell
            
           
            
        }
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //日付設定
                dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yMMMd(EEE)", options: 0,locale: Locale(identifier: "ja_JP"))
                
                let date = dateFormatter.string(from: dt)
                print(date)
                
                //↑変数　日付表示
                NowDay.text = date
                
                let arrWeekday: Array = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
                
               let date1 = NSDate()
                let calendar = NSCalendar(calendarIdentifier: NSCalendar.Identifier.gregorian)

                
                _ = calendar?.component(.year, from: date1 as Date)
                
                _ = calendar?.component(.month, from: date1 as Date)
                
                _ = calendar?.component(.day, from: date1 as Date)
                
                let weekday = calendar?.component(.weekday, from: date1 as Date)
                
            
                _ = arrWeekday[weekday! - 1]

        
        super.viewDidLoad()
    
        
        //追加画面で入力した内容を取得する
        if UserDefaults.standard.object(forKey: "TodoList") != nil {
            todoList = UserDefaults.standard.object(forKey: "TodoList") as! [String]
            
            
            
                   
                
    }

       
}

    //最初からあるコード
       override func didReceiveMemoryWarning() {
           super.didReceiveMemoryWarning()
       }
    
    
    //修正中1231
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped table view")
        
        let storyboard = UIStoryboard.init(name: "List", bundle: nil)
        let listViewController = storyboard.instantiateViewController(withIdentifier: "ListViewController")
        navigationController?.pushViewController(listViewController, animated: true)
    }
    

    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
          //アイテム削除の処理
        todoList.remove(at: indexPath.row)
          let indexPaths = [indexPath]
          tableView.deleteRows(at: indexPaths, with: .automatic)
        UserDefaults.standard.set( todoList, forKey: "TodoList" )
        
   
        
          }
    

}





