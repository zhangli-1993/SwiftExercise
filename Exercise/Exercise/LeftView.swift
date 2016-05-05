//
//  LeftView.swift
//  Exercise
//
//  Created by 延强赵 on 16/5/5.
//
//

import UIKit

class LeftView: UIView {

    var tableView: UITableView?
    
    let array = ["附近", "同城", "全国", "关注"]
    
    
 
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 4
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell:UITableViewCell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) 
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
