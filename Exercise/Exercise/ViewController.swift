//
//  ViewController.swift
//  Exercise
//
//  Created by 延强赵 on 16/5/5.
//
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {
    private let reuseIdentifier = "Cell"
     var collection : UICollectionView?
    var tag = 1
    
    @IBOutlet weak var leftBtn: UIButton!
    @IBAction func Live(sender: AnyObject) {
        if tag == 1 {
            self.view.addSubview(collection!)
         tag = 2
        }else{
            collection?.removeFromSuperview()
            tag = 1
        }
        
        
        
    }
    
   
       
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
        self.title = "同城"
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: self.view.frame.size.width/2-5, height: self.view.frame.size.width*0.75)
        layout.scrollDirection = .Vertical
        collection = UICollectionView(frame:CGRectMake(0, 64, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height-108), collectionViewLayout: layout)
        
        collection!.delegate = self
        collection!.dataSource = self
        collection!.registerNib(UINib(nibName: "LiveCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)

        
        rightBtn.tag = 1

        

        
        
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    @IBAction func presentLeftView(sender: AnyObject) {
        LeftView.beginAnimations(nil, context: nil)
        LeftView.setAnimationDuration(0.5)

        if tag == 2 {
            leftView.center = CGPointMake(90, self.view.frame.size.height/2)
            collection!.center = CGPointMake(self.view.frame.size.width/2 + 180, self.view.frame.size.height/2)
            if self.leftBtn.tag % 2 == 1 {
                leftView.center = CGPointMake(-90, self.view.frame.size.height/2)
                collection!.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)
            }

        } else {

        if self.leftBtn.tag % 2 == 0 {
            leftView.center = CGPointMake(90, self.view.frame.size.height/2)
            self.tableView.center = CGPointMake(self.view.frame.size.width/2 + 180, self.view.frame.size.height/2)
            
        } else {
              leftView.center = CGPointMake(-90, self.view.frame.size.height/2)
            self.tableView.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)
 
        }
    }
        LeftView.setAnimationCurve(UIViewAnimationCurve.EaseOut)
        LeftView.commitAnimations()

        self.leftBtn.tag = self.leftBtn.tag + 1
        

        
        
        
        
    }
    func handleSwipeGesture(sender: UISwipeGestureRecognizer){
        LeftView.beginAnimations(nil, context: nil)
        LeftView.setAnimationDuration(1.0)
        leftView.center = CGPointMake(-90, self.view.frame.size.height/2)


        if tag == 2 {
            collection!.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)
        } else {
        self.tableView.center = CGPointMake(self.view.frame.size.width/2, self.view.frame.size.height/2)
        }
        LeftView.setAnimationCurve(UIViewAnimationCurve.EaseOut)
        LeftView.commitAnimations()
        self.leftBtn.tag = self.leftBtn.tag + 1

    }


    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 20
    }
    
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as? DynamicTableViewCell
        return cell!
        
    }
    
    
    
     func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
     func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 20
    }
    
     func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as!LiveCollectionViewCell
        
        // Configure the cell
        
        return cell
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

