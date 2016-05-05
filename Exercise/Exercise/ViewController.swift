//
//  ViewController.swift
//  Exercise
//
//  Created by 延强赵 on 16/5/5.
//
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var leftBtn: UIButton!
    
    
    @IBOutlet weak var rightBtn: UIButton!
    
    
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib: UINib = UINib(nibName: "DynamicTableViewCell", bundle: nil)
        self.tableView.registerNib(cellNib, forCellReuseIdentifier: "cell")
        self.tableView.rowHeight = 224
        
        
        
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 20
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as? DynamicTableViewCell
        return cell!
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

