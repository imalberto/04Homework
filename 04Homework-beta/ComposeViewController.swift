//
//  ComposeViewController.swift
//  04Homework-beta
//
//  Created by albertoc on 6/28/14.
//  Copyright (c) 2014 AC. All rights reserved.
//

import UIKit

class ComposeViewController: UIViewController {


  @IBOutlet var nevermindButton: UIButton
  
  @IBOutlet var textButton: UIButton
  @IBOutlet var photoButton: UIButton
  @IBOutlet var quoteButton: UIButton
  @IBOutlet var linkButton: UIButton
  @IBOutlet var chatButton: UIButton
  @IBOutlet var videoButton: UIButton
  
  
  
  

  init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
    super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    // Custom initialization
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor(red: 53/255, green: 70/255, blue: 91/255, alpha: 0.9)
    
    self.buttons = [
      self.photoButton,
      self.chatButton,
      self.quoteButton,
      self.textButton,
      self.linkButton,
      self.videoButton
    ]
    for btn in self.buttons {
      self.pos.append(btn.center)
    }
  }

  override func viewDidAppear(animated: Bool) {
    self.showButtons()
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
  
  func showButtons(Void) -> Void {
  
    for btn in self.buttons {
      btn.center = CGPointMake(btn.center.x, self.view.center.y + 600)
      btn.alpha = 1
    }

    var base = 0.2
    var delta = 0.0
    var i = 0
    for btn in self.buttons {
      UIView.animateWithDuration((base + delta), animations: {
        btn.center = self.pos[i]
      }, completion: nil)
      
      delta += 0.09
      i++
    }
  }
  func hideButtons(Void) -> Void {
    var base = 0.3 // different base to slow down
    var delta = 0.0
    var i = 0
    var done = 6
    for btn in self.buttons {
      let options = UIViewAnimationOptions.CurveEaseIn
      UIView.animateWithDuration((base + delta), delay: 0, options: options, animations: {
        btn.center = CGPointMake(btn.center.x, -700)
        }, completion: { (Bool) -> Void in
          done--
          if done == 2 {

//            UIView.animateWithDuration(0.001, animations: {
//                self.view.alpha = 0
//            }, completion: { (Bool) -> Void in
//                self.dismissViewControllerAnimated(false, completion: {})
//            })
            self.dismissViewControllerAnimated(true, completion: {})
          }
        })
      
      delta += 0.1
      i++
    }

  }
  func restoreButtons() {
    for btn in self.buttons {
      btn.center = CGPointMake(btn.center.x, self.view.center.y + 600)
    }
  }

  @IBAction func onNevermind(sender: UIButton) {
    NSLog("onNevermind")
    self.hideButtons()
  }

  var buttons: UIButton[]!
  var pos: CGPoint[] = []

}
