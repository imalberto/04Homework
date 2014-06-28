//
//  MainViewController.swift
//  04Homework-beta
//
//  Created by albertoc on 6/28/14.
//  Copyright (c) 2014 AC. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {


  @IBOutlet var tabBarView: UIView
  @IBOutlet var homeButton: UIButton
  @IBOutlet var searchButton: UIButton
  @IBOutlet var composeButton: UIButton
  @IBOutlet var accountButton: UIButton
  @IBOutlet var trendButton: UIButton


  init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    // Custom initialization
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    self.tabBarView.backgroundColor = UIColor(red: 51.0/255.0, green: 66.0/255.0, blue: 86.0/255.0, alpha: 1.0)
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


  func resetButtonStates() -> Void{
    let bb = [
      self.homeButton,
      self.searchButton,
      self.composeButton,
      self.accountButton,
      self.trendButton
    ]
    
    for b in bb {
      b.selected = false
    }
  }

  @IBAction func onHome(sender: UIButton) {
    NSLog("onHome")

    resetButtonStates()
    sender.selected = true
  }

  @IBAction func onSearch(sender: UIButton) {
    NSLog("onSearch")
    
    resetButtonStates()
    sender.selected = true
  }

  @IBAction func onCompose(sender: UIButton) {
    NSLog("onCompose")
    
    resetButtonStates()
    sender.selected = true
  }

  @IBAction func onAccount(sender: UIButton) {
    NSLog("onAccount")
    
    resetButtonStates()
    sender.selected = true
  }

  @IBAction func onTrend(sender: UIButton) {
    NSLog("onTrend")
    
    resetButtonStates()
    sender.selected = true
  }





}
