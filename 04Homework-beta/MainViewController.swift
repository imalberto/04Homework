//
//  MainViewController.swift
//  04Homework-beta
//
//  Created by albertoc on 6/28/14.
//  Copyright (c) 2014 AC. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIGestureRecognizerDelegate {

  @IBOutlet var tabBarView: UIView
  @IBOutlet var homeButton: UIButton
  @IBOutlet var searchButton: UIButton
  @IBOutlet var composeButton: UIButton
  @IBOutlet var accountButton: UIButton
  @IBOutlet var trendButton: UIButton
  @IBOutlet var containerView: UIView


  init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    // Custom initialization
    self.homeVC = HomeViewController(nibName: nil, bundle: nil)
    self.homeVC.mainVC = self
    self.homeNC = UINavigationController(rootViewController: self.homeVC)
    self.homeNC.navigationBar.translucent = false
    
    self.searchVC = SearchViewController(nibName: nil, bundle: nil)
    
    self.composeVC = ComposeViewController(nibName: nil, bundle: nil)

    self.accountVC = AccountViewController(nibName: nil, bundle: nil)
    
    self.activityVC = ActivityViewController(nibName: nil, bundle: nil)
    self.activityNC = UINavigationController(rootViewController: activityVC)
    self.activityNC.navigationBar.translucent = false
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.clearColor()

    self.containerView.backgroundColor = UIColor.clearColor()

    self.tabBarView.backgroundColor = UIColor(red: 51.0/255.0, green: 66.0/255.0, blue: 86.0/255.0, alpha: 1.0)

    self.onHome(self.homeButton)
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

  func onTap(gesture: UITapGestureRecognizer) {
    NSLog("onTap")
    // self.onSearch(self.searchButton)
  }
  
  func startAnimation(Void) -> Void {
    UIView.animateWithDuration(1.5, animations: {
        if self.xyTop {
          self.bubbleImageView.center = self.endXY
        } else {
          self.bubbleImageView.center = self.startXY
        }
    }, completion: {(Bool) -> Void in
        self.xyTop = !self.xyTop
        self.startAnimation()
    })
  }
  
  func gestureRecognizer(gestureRecognizer: UIGestureRecognizer!, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer!) -> Bool {
    return true
  }
  
  func resetUI() -> Void{
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
    
    let vcs = [
      self.accountVC,
      self.activityNC,
      self.composeVC,
      self.homeNC,
      self.searchVC
    ]
    for vc : AnyObject in vcs {
      if let v = vc as? UIViewController {
         v.view.removeFromSuperview()
      }
    }
  }

  func syncUI(Void) -> Void {
  
    struct Token {
      static var token: dispatch_once_t = 0
    }
    
    self.containerView.addSubview(self.currentView)
    
    dispatch_once(&Token.token) {
      self.bubbleImageView = UIImageView(image: UIImage(named: "search-bubble"))
      self.bubbleImageView.alpha = 0
      self.bubbleImageView.center = self.startXY
      self.bubbleImageView.userInteractionEnabled = true
      self.tapGestureRecognizer = UITapGestureRecognizer(target: self, action: "onTap:")
      self.tapGestureRecognizer.delegate = self
      self.tapGestureRecognizer.numberOfTapsRequired = 1
      self.bubbleImageView.addGestureRecognizer(self.tapGestureRecognizer)

      self.tabBarView.addSubview(self.bubbleImageView)
      self.tabBarView.userInteractionEnabled = true

      self.startAnimation()
    }
    
  
    var alpha:CGFloat = 1.0
    if self.showBubble == false {
      alpha = 0.0
    }
    
    if self.showBubble == true && self.bubbleImageView.alpha == alpha {
      return
    }
    
    UIView.animateWithDuration(0.2, animations: {
      self.bubbleImageView.alpha = alpha
    }, completion: nil)
  }

  @IBAction func onHome(sender: UIButton) {
    NSLog("onHome")

    resetUI()
    sender.selected = true
    self.currentView = homeNC.view
    self.showBubble = true
    self.syncUI()
  }

  @IBAction func onSearch(sender: UIButton) {
    NSLog("onSearch")

    self.resetUI()
    sender.enabled = true
    self.currentView = self.searchVC.view
    self.showBubble = false
    self.syncUI()
  }

  @IBAction func onCompose(sender: UIButton) {
    NSLog("onCompose")
    
    self.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
    self.modalPresentationStyle = UIModalPresentationStyle.CurrentContext
    self.presentViewController(self.composeVC, animated: true, completion: {(Void) -> Void in
    })
  }

  @IBAction func onAccount(sender: UIButton) {
    NSLog("onAccount")
    
    resetUI()
    sender.selected = true
    self.currentView = self.accountVC.view
    self.showBubble = true
    self.syncUI()
    
  }

  @IBAction func onTrend(sender: UIButton) {
    NSLog("onTrend")
    
    resetUI()
    sender.selected = true
    self.currentView = self.activityNC.view
    self.showBubble = true
    self.syncUI()
  }
  var tapGestureRecognizer: UITapGestureRecognizer!
  var bubbleImageView: UIImageView!
  let startXY: CGPoint = CGPointMake(100, -35)
  let endXY: CGPoint = CGPointMake(100, -25)
  var xyTop: Bool = true
  var showBubble: Bool = true
  
  var currentView: UIView!
  var homeNC: UINavigationController!
  var homeVC: HomeViewController!
  var accountVC: AccountViewController!
  var searchVC: SearchViewController!
  var activityVC: ActivityViewController!
  var activityNC: UINavigationController!
  var composeVC: ComposeViewController!
}

protocol TabBarControllerDelegate : NSObjectProtocol {
  func tabBar(tabBar: MainViewController, didSelectViewController: UIViewController) -> Void
}
