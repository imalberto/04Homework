//
//  ComposeViewController.swift
//  04Homework-beta
//
//  Created by albertoc on 6/28/14.
//  Copyright (c) 2014 AC. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {

  init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    // Custom initialization
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor(red: 53/255, green: 70/255, blue: 91/255, alpha: 0.7)
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

}
