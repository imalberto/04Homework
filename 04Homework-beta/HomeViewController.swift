//
//  HomeViewController.swift
//  04Homework-be3a
//
//  Created by albertoc on 6/28/14.
//  Copyright (c) 2014 AC. All rights reserved.
//

import UIKit
import QuartzCore

class HomeViewController: UIViewController {

  @IBOutlet var scrollView: UIScrollView
  @IBOutlet var imageView: UIImageView



  init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    // Custom initialization

    let titleImageView = UIImageView(image: UIImage(named: "tumblr-logo"))
    self.navigationItem.titleView = titleImageView
    
    self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log in", style: UIBarButtonItemStyle.Done, target: self, action: "onLogin:")
    self.navigationItem.rightBarButtonItem.tintColor = UIColor.lightGrayColor()
    
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    self.scrollView.backgroundColor = UIColor(red: 51/255, green: 70/255, blue: 93/255, alpha: 1)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }


  /*
  // #pragma mark - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
  }
  */
  
  func onLogin(sender: UIBarButtonItem) {
    NSLog("Login")

    let loginVC = LoginViewController(nibName: nil, bundle: nil)
    self.mainVC.modalPresentationStyle = UIModalPresentationStyle.CurrentContext
    self.mainVC.modalTransitionStyle = UIModalTransitionStyle.CoverVertical
    
    self.mainVC.presentViewController(loginVC, animated: false, completion: {})
  }

  var mainVC: MainViewController!

}
