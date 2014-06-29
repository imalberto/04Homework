//
//  SearchViewController.swift
//  04Homework-beta
//
//  Created by albertoc on 6/28/14.
//  Copyright (c) 2014 AC. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {


  @IBOutlet var scrollView: UIScrollView
  @IBOutlet var imageView: UIImageView

  init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    // Custom initialization
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    
    self.scrollView.alpha = 0
    self.scrollView.contentSize = self.imageView.image.size
    self.view.backgroundColor = UIColor(red: 51/255, green: 70/255, blue: 93/255, alpha: 1)
    
    self.frames = [
      UIImageView(image: UIImage(named: "loading-1")),
      UIImageView(image: UIImage(named: "loading-2")),
      UIImageView(image: UIImage(named: "loading-3"))
    ]
    
    self.animView = UIView(frame: CGRectMake(0, 0, 61, 19))
    self.animView.center = CGPointMake(self.view.frame.midX, self.view.frame.midY)
    self.animView.backgroundColor = UIColor.clearColor()
    self.animView.addSubview(self.frames[0])
    self.index++

    self.view.insertSubview(self.animView, aboveSubview: self.scrollView)
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  override func viewWillAppear(animated: Bool) {
    if self.timer == nil {
      self.timer = NSTimer.scheduledTimerWithTimeInterval(0.3, target: self, selector: "animateMe:", userInfo: nil, repeats: true)
    }
  }
  override func viewDidAppear(animated: Bool) {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), {
      UIView.animateWithDuration(0.2, animations: {
        self.scrollView.alpha = 1
        self.animView.alpha = 0
        }, completion: {(Bool) -> Void in
          NSLog("scrollview should be visible")
        })
      })
  }

  override func viewWillDisappear(animated: Bool) {
    self.animView.alpha = 1
    self.scrollView.alpha = 0
  }

  /*
  // #pragma mark - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
  }
  */

  func animateMe(timer: NSTimer) -> Void {
    let view = self.frames[self.index]
    self.animView.addSubview(view)
    self.index++
    self.index %= 3
  }

  
  var index = 0
  var frames: UIImageView[]!
  var animView: UIView!
  var timer: NSTimer!

}
