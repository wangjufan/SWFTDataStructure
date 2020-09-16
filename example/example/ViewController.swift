//
//  ViewController.swift
//  example
//
//  Created by jufan wang on 2020/9/2.
//  Copyright © 2020 jufan wang. All rights reserved.
//

import UIKit

func balance(_ x: inout Int, _ y: inout Int) {
    let sum = x + y
    x = sum / 2
    y = sum - x
}

struct Player {
    var name: String
    var health: Int
    var energy: Int
    
    static let maxHealth = 10
    mutating func restoreHealth() {
        health = Player.maxHealth
    }
}

extension Player {
    mutating func shareHealth(with teammate: inout Player) {
    }
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellID = "cell";
    let arr = ["array", "dictionary", "array", ];
    var theClosure : ((_ name: String)->()) = {
         (name: String)->() in
    };
    
    public func trailingClosures(parameter:String,block:(_:String)->Void) -> Void {
        block(parameter + " 期待下：trailingClosures")
    }
    
   
 
    
    public func trailingClosures33(block: ()->(Void)) -> Void {
        block()
    }
    
    public func blockFunction(_ paramter:String)->Void {
        print(paramter)
    }
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
       // Prints "5"
        
        let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
        let nam = names.sorted(by: >)

        let reversedNames = names.sorted(by: ){ $0 > $1 }
        let tableView = UITableView(frame: view.bounds)
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        cell?.textLabel?.text = arr[indexPath.row];
        let possibleNumber = "123";
//        let language: String? = "Swift"
//        var name: String? = nil
//        var name: Optional<Int> = 24
        let convertedNumber = Int(possibleNumber);//浮点与字符 返回optional常量
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

