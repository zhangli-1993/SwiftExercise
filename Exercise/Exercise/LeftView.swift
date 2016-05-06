//
//  LeftView.swift
//  Exercise
//
//  Created by 延强赵 on 16/5/5.
//
//

import UIKit

class LeftView: UIView, UITableViewDelegate, UITableViewDataSource {

    var tableView: UITableView?
    
    let array = ["附近", "同城", "全国", "关注"]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        tableView = UITableView(frame:CGRectMake(0,64, 180, UIScreen.mainScreen().bounds.size.height-108), style: .Plain)
        tableView?.delegate = self
        tableView?.dataSource = self
        tableView!.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView?.backgroundColor = UIColor.grayColor()
        tableView?.rowHeight = 100
        self.addSubview(tableView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return array.count
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        cell.backgroundColor = UIColor.grayColor()
        cell.textLabel?.text = array[indexPath.row]
        return cell
        
    }

    
    
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
