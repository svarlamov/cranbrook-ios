//
//  PageViewContainer.swift
//  Cranbrook Kingswood
//
//  Created by private on 8/10/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON
import ObjectMapper
import Alamofire

class PageViewContainer: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    var pages = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.delegate = self
        self.dataSource = self
        
        setupPageView()
        
    }
    
    func setupPageView() {
        
        let classView: UIViewController! = storyboard?.instantiateViewControllerWithIdentifier(SelectedTabOptions.ClassesTab.rawValue)
        let assignmentView: UIViewController! = storyboard?.instantiateViewControllerWithIdentifier(SelectedTabOptions.AssignmentsTab.rawValue)
        let searchView: UIViewController! = storyboard?.instantiateViewControllerWithIdentifier(SelectedTabOptions.DirectorySearchTab.rawValue)
        
        pages.append(classView)
        pages.append(assignmentView)
        pages.append(searchView)
        
        setViewControllers([classView], direction: UIPageViewControllerNavigationDirection.Forward, animated: false, completion: nil)
        
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {
        let currentIndex = pages.indexOf(viewController)!
        let previousIndex = abs((currentIndex - 1) % pages.count)
        return pages[previousIndex]
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {
        let currentIndex = pages.indexOf(viewController)!
        let nextIndex = abs((currentIndex + 1) % pages.count)
        return pages[nextIndex]
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return 0
    }
}