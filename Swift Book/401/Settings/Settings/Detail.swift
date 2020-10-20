//
//  Detail.swift
//  Settings
//
//  Created by nayhan on 20.10.2020.
//  Copyright © 2020 com.hrdijital. All rights reserved.
//

import UIKit

class Detail: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate , UIScrollViewDelegate  {
    private var pageController: UIPageViewController!
    private var arrVC:[UIViewController] = []
    private var currentPage: Int!
    var detailInfo: DetailInfo  = {
           var vctrl = DetailInfo()
           return vctrl
    }()
    var explanation: Explanation  = {
              var vctrl = Explanation()
              return vctrl
    }()
    var segmentView: UIView = {
       let view  = UIView()
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    var segments: SecondSegment!
    override func viewDidLoad() {
        super.viewDidLoad()
 
        view.backgroundColor = .white
        
        setSegment()
        
    }
    func setSegment(){
        self.currentPage = 0
        self.setSecondSegment()
        self.createPageViewController()
        self.arrVC.append(detailInfo)
        self.arrVC.append(explanation)
        self.segments.updateSegmentedControlSegs(index: currentPage)
        self.setPage()
    }
     
    @objc func setPage() {
        pageController.setViewControllers([detailInfo], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
        addChild(pageController)
        self.view.addSubview(pageController.view)
        pageController.didMove(toParent: self)
    }
    
    func setSecondSegment() {
        
           let title = "İlan Bilgileri,Açıklama"
           segments = SecondSegment.init(frame: CGRect.init(x: 8, y:  130, width: self.view.frame.width - 16 , height: 45))
           segments.selectedSegmentIndex  = 0
           segments.commaSeperatedButtonTitles =  title
           segments.selectorTextColor =  UIColor.init(named: "text")!
           segments.addTarget(self, action: #selector(onChangeOfSegment(_:)), for: .valueChanged)
           segments.backgroundColor    = UIColor.lightGray
           segments.layer.borderColor  = UIColor.lightGray.cgColor
           segments.layer.borderWidth  = 3
           segments.layer.cornerRadius = 5
           segments.cornerRadius = 5
           segments.layer.masksToBounds = true
           view.addSubview(segments)
          
          
    }
    private func createPageViewController() {
        pageController = UIPageViewController.init(transitionStyle: UIPageViewController.TransitionStyle.scroll, navigationOrientation: UIPageViewController.NavigationOrientation.horizontal, options: nil)
        
        pageController.view.backgroundColor = UIColor.clear
        pageController.delegate = self
        pageController.dataSource = self
    
        for svScroll in pageController.view.subviews as! [UIScrollView] {
            svScroll.delegate = self
            svScroll.isScrollEnabled = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() ) {
            self.pageController.view.frame = CGRect(x: 0, y: self.segments.frame.maxY, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
            
        }
        pageController.setViewControllers([detailInfo], direction: UIPageViewController.NavigationDirection.forward, animated: false, completion: nil)
        self.addChild(pageController)
        self.view.addSubview(pageController.view)
        pageController.didMove(toParent: self)
    }
    private func indexofviewController(viewCOntroller: UIViewController) -> Int {
        if(arrVC .contains(viewCOntroller)) {
          return arrVC.firstIndex(of: viewCOntroller)!
        }
        return -1
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        var index = indexofviewController(viewCOntroller: viewController)
           if(index != -1) {
               index = index - 1
           }
           
           if(index < 0) {
               return nil
           }
           else {
               return arrVC[index]
           }
           
     }
     func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
           
           var index = indexofviewController(viewCOntroller: viewController)
           
           if(index != -1) {
               index = index + 1
           }
           
           if(index >= arrVC.count) {
               return nil
           }
           else {
               return arrVC[index]
           }
           
     }
     func pageViewController(_ pageViewController1: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
           
           if(completed) {
            currentPage = arrVC.firstIndex(of: (pageViewController1.viewControllers?.last)!)
               
               self.segments.updateSegmentedControlSegs(index: currentPage)
               
           }
     }
     @objc func onChangeOfSegment(_ sender: SecondSegment) {
           
           switch sender.selectedSegmentIndex {
           case 0:
            self.pageController.definesPresentationContext = true
            pageController.modalPresentationStyle = .currentContext
             
            pageController.setViewControllers([arrVC[0]], direction: .forward, animated: true, completion: nil)
               currentPage = 0
           case 1:
           
               if currentPage > 1{
                self.pageController.definesPresentationContext = true
                pageController.modalPresentationStyle = .currentContext
                pageController.setViewControllers([arrVC[1]], direction:.forward, animated: true, completion: nil)
                   currentPage = 1
                
               }else{
                pageController.setViewControllers([arrVC[1]], direction:.forward, animated: true, completion: nil)
                   currentPage = 1
               }
           default:
               break
           }
            segments.cornerRadius = 5
     }
}
