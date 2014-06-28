//
//  HomeViewController.swift
//  04Homework-beta
//
//  Created by albertoc on 6/28/14.
//  Copyright (c) 2014 AC. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {


  @IBOutlet var scrollView: UIScrollView
  @IBOutlet var imageView: UIImageView



  init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    // Custom initialization

    let titleImageView = UIImageView(image: UIImage(named: "tumblr-logo"))
    self.navigationItem.titleView = titleImageView
    
    let loginImageView = UIImageView(image: UIImage(named: "login-button"))
    let loginButton = UIBarButtonItem(customView: loginImageView)
    loginButton.target = self
    loginButton.action = "onLogin:"
    self.navigationItem.rightBarButtonItem = loginButton
    
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    self.scrollView.backgroundColor = UIColor(red: 51/255, green: 70/255, blue: 93/255, alpha: 1)
    self.scrollView.contentSize = CGSizeMake(self.imageView.frame.size.width, self.scrollView.frame.size.height)
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
  }

}
