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
   
    override func viewDidLoad() {
        super.viewDidLoad()
        let cellNib: UINib = UINib(nibName: "DynamicTableViewCell", bundle: nil)
        self.tableView.registerNib(cellNib, forCellReuseIdentifier: "cell")
        self.tableView.rowHeight = 224
        
        self.title = "同城"
        let layout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize(width: 200, height: 300)
        layout.scrollDirection = .Vertical
       collection = UICollectionView(frame: self.tableView.frame, collectionViewLayout: layout)
       
        collection!.delegate = self
        collection!.dataSource = self
        collection!.registerNib(UINib(nibName: "LiveCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view, typically from a nib.
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

