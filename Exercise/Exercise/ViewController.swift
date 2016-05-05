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
    var leftView: LeftView = LeftView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib: UINib = UINib(nibName: "DynamicTableViewCell", bundle: nil)
        self.tableView.registerNib(cellNib, forCellReuseIdentifier: "cell")
        self.tableView.rowHeight = 224
        self.leftView.frame = CGRectMake(-180, 0, 180, self.view.frame.size.height)
        self.leftView.backgroundColor = UIColor.grayColor()
        self.view.addSubview(leftView)
        self.leftBtn.tag = 100
        let swipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.handleSwipeGesture(_:)))
        swipeGesture.direction = UISwipeGestureRecognizerDirection.Left
        self.view.addGestureRecognizer(swipeGesture)
        

        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func presentLeftView(sender: AnyObject) {

        if self.leftBtn.tag % 2 == 0 {
            LeftView.beginAnimations(nil, context: nil)
            LeftView.setAnimationDuration(1.0)
            leftView.center = CGPointMake(90, self.view.frame.size.height/2)
            self.tableView.center = CGPointMake(self.view.frame.size.width/2 + 180, self.view.frame.size.height/2)
            LeftView.setAnimationCurve(UIViewAnimationCurve.EaseOut)
            LeftView.commitAnimations()
            
        } else {
            LeftView.beginAnimations(nil, context: nil)
            LeftView.setAnimationDuration(1.0)
            leftView.center = CGPointMake(-90, self.view.frame.size.height/2)
            self.tableView.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)
            LeftView.setAnimationCurve(UIViewAnimationCurve.EaseOut)
            LeftView.commitAnimations()

        }
        
        self.leftBtn.tag = self.leftBtn.tag + 1
        

        
        
        
        
    }
    func handleSwipeGesture(sender: UISwipeGestureRecognizer){
        LeftView.beginAnimations(nil, context: nil)
        LeftView.setAnimationDuration(1.0)
        leftView.center = CGPointMake(-90, self.view.frame.size.height/2)
        self.tableView.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)
        LeftView.setAnimationCurve(UIViewAnimationCurve.EaseOut)
        LeftView.commitAnimations()
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

