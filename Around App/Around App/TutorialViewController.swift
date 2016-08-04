//
//  TutorialViewController.swift
//  UIPageViewController Post
//
//  Created by Jeffrey Burt on 2/3/16.
//  Copyright © 2016 Seven Even. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var constrains: NSLayoutConstraint!
    var tutorialPageViewController: TutorialPageViewController? {
        didSet {
            tutorialPageViewController?.tutorialDelegate = self
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pageControl.addTarget(self, action: "didChangePageControlValue", forControlEvents: .ValueChanged)
        
        pageControl.transform = CGAffineTransformMakeScale(1.5, 1.5)
        
        if DeviceType.IS_IPHONE_5 || DeviceType.IS_IPHONE_6
        {
            self.constrains.constant = 9
            self.view.layoutIfNeeded()
        }
        
        else if DeviceType.IS_IPHONE_4_OR_LESS
        {
            self.constrains.constant = 3
            self.view.layoutIfNeeded()
        }
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "jumpToPage:", name:"jumpToPage", object: nil)
    }
     func jumpToPage(notify : NSNotification) {
        tutorialPageViewController?.scrollToNextViewController()
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let tutorialPageViewController = segue.destinationViewController as? TutorialPageViewController {
            self.tutorialPageViewController = tutorialPageViewController
        }
    }

    @IBAction func didTapNextButton(sender: UIButton) {
        tutorialPageViewController?.scrollToNextViewController()
    }
    
    /**
     Fired when the user taps on the pageControl to change its current page.
     */
    func didChangePageControlValue() {
       tutorialPageViewController?.scrollToViewController(index: pageControl.currentPage)
    }
}

extension TutorialViewController: TutorialPageViewControllerDelegate {
    
    func tutorialPageViewController(tutorialPageViewController: TutorialPageViewController,
        didUpdatePageCount count: Int) {
            pageControl.numberOfPages = count
    }
    
    func tutorialPageViewController(tutorialPageViewController: TutorialPageViewController,
        didUpdatePageIndex index: Int) {
            pageControl.currentPage = index
    }
    
}
