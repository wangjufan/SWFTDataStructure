//
//  ArrayVC.swift
//  example
//
//  Created by jufan wang on 2020/9/2.
//  Copyright © 2020 jufan wang. All rights reserved.
//

import UIKit

class ArrayVC: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let cellID = "cell";
    var arr = ["array", "dictionary", "array", ];
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        as child to parent
//        as! parent to child, may return error
//            as?使用场合
//            as? 和 as! 操作符的转换规则完全一样。但 as? 如果转换不成功的时候便会返回一个 nil 对象。
//        成功的话返回可选类型值（optional），需要我们拆包使用。
//        由于 as? 在转换失败的时候也不会出现错误，所以对于如果能确保100%会成功的转换则可使用 as!，否则使用 as?
        let tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self;
        tableView.delegate = self;
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        cell?.textLabel?.text = arr[indexPath.row];
         
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let array = ArrayVC();
            self.present(array, animated: true) {
                
            };
            break;
        default: break
        };
    }
    
    
}
