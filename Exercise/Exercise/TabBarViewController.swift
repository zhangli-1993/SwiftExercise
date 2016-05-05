//
//  TabBarViewController.swift
//  Exercise
//
//  Created by 延强赵 on 16/5/5.
//
//

import UIKit

class TabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addCenterButton(btnimage: UIImage(named: "图片")!,  selector: "addOrderView", view: self.view)

        // Do any additional setup after loading the view.
    }
    func addCenterButton(btnimage buttonImage:UIImage,selector:String,view:UIView)
    {
        //创建一个自定义按钮
        let button:UIButton = UIButton(type: UIButtonType.Custom)
        //btn.autoresizingMask
        //button大小为适应图片
        button.frame = CGRectMake(0, 0, buttonImage.size.width, buttonImage.size.height);
        button.setImage(buttonImage, forState: UIControlState.Normal)
       
        //去掉阴影
        button.adjustsImageWhenDisabled = true;
        //按钮的代理方法
        button.addTarget( self, action: Selector(selector), forControlEvents:UIControlEvents.TouchUpInside )
        //高度差
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
        let blackView = UIView.init(frame: self.view.frame)
        blackView.backgroundColor = UIColor(red: 95/265.0, green: 95/265.0, blue: 95/265.0, alpha: 0.8)
        self.view.addSubview(blackView)
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
