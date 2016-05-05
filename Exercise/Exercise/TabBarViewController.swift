//
//  TabBarViewController.swift
//  Exercise
//
//  Created by 延强赵 on 16/5/5.
//
//

import UIKit

class TabBarViewController: UITabBarController {
var blackView = UIView()
    var liveBtn : UIButton?
    var photoBtn : UIButton?
    var videoBtn : UIButton?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addCenterButton(btnimage: UIImage(named: "图片")!,  selector: "addOrderView", view: self.view)
        blackView.frame = CGRectMake(0, UIScreen.mainScreen().bounds.size.height, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height-108)
        blackView.backgroundColor = UIColor(red: 95/265.0, green: 95/265.0, blue: 95/265.0, alpha: 0.8)
        // Do any additional setup after loading the view.
    }
    func addCenterButton(btnimage buttonImage:UIImage,selector:String,view:UIView)
    {
       
        let button:UIButton = UIButton(type: UIButtonType.Custom)
   
        button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
        button.setImage(buttonImage, forState: UIControlState.Normal)
       
        
        button.adjustsImageWhenDisabled = true;
        
        button.addTarget( self, action: Selector(selector), forControlEvents:UIControlEvents.TouchUpInside )
        let heightDifference:CGFloat = buttonImage.size.height - self.tabBar.frame.size.height
        if (heightDifference < 0){
            button.center = self.tabBar.center;
        }
        else
        {
            var center:CGPoint = self.tabBar.center;
            center.y = center.y - heightDifference/2.0;
            button.center = center;
        }
        view.addSubview(button);
    }
    
    
    //按钮方法
    func addOrderView()
    {
        
        blackView.backgroundColor = UIColor(red: 95/265.0, green: 95/265.0, blue: 95/265.0, alpha: 0.8)
        photoBtn = UIButton(type: .Custom)
        photoBtn!.frame = CGRectMake(100, 200, 100, 100)
        photoBtn!.setBackgroundImage(UIImage(named: "photo.jpg"), forState: .Normal)
        photoBtn!.addTarget(self, action: #selector(TabBarViewController.photoAction), forControlEvents: .TouchUpInside)
        blackView.addSubview(photoBtn!)
        
         liveBtn = UIButton(type: .Custom)
        liveBtn!.frame = CGRectMake(240, 200, 100, 100)
        liveBtn!.setBackgroundImage(UIImage(named: "live.jpg"), forState: .Normal)
        liveBtn!.addTarget(self, action: #selector(TabBarViewController.liveAction), forControlEvents: .TouchUpInside)
        blackView.addSubview(liveBtn!)

        
        videoBtn = UIButton(type: .Custom)
        videoBtn!.frame = CGRectMake(150, 350, 100, 100)
        videoBtn!.setBackgroundImage(UIImage(named: "video.jpg"), forState: .Normal)
        videoBtn!.addTarget(self, action: #selector(TabBarViewController.videoAction), forControlEvents: .TouchUpInside)
             blackView.addSubview(videoBtn!)
 self.view.addSubview(blackView)
       
            UIView.animateWithDuration(1) {
                self.blackView.frame = CGRectMake(0, 64, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height-108)
            }
        
   
        
       
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {

        UIView.animateWithDuration(1) {
            self.blackView.frame = CGRectMake(0, UIScreen.mainScreen().bounds.size.height, UIScreen.mainScreen().bounds.size.width, UIScreen.mainScreen().bounds.size.height-108)
        }

        
       
    }
    func photoAction() {
        print("photo")
    }
    func liveAction() {
        print("live")
    }
    func videoAction() {
        print("video")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
