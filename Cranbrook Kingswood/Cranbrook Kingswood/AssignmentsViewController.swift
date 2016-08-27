//
//  AssignmentsViewController.swift
//  Cranbrook Kingswood
//
//  Created by private on 8/6/16.
//  Copyright © 2016 stefandeclerck. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
import Unbox

class AssignmentsViewController: UIViewController, AKPickerViewDataSource, AKPickerViewDelegate {
    
    @IBOutlet var pickerView: AKPickerView!
    
    let titles = ["Tokyo", "Kanagawa", "Osaka", "Aichi", "Saitama", "Chiba", "Hyogo", "Hokkaido", "Fukuoka", "Shizuoka"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    func setupViews() {
        setupPickerView()
    }
    
    func setupPickerView() {
        self.pickerView.delegate = self
        self.pickerView.dataSource = self
        self.pickerView.font = UIFont(name: "Avenir Next", size: 17)!
        self.pickerView.highlightedFont = UIFont(name: "Avenir Next", size: 17)!
        self.pickerView.textColor = UIColor(red: 21/255, green: 41/255, blue: 53/255, alpha: 1.0)
        self.pickerView.interitemSpacing = self.view.frame.size.width/5
        self.pickerView.pickerViewStyle = .Wheel
        self.pickerView.maskDisabled = false
        self.pickerView.reloadData()
    }
    
    //  MARK: - AKPickerView setup
    func numberOfItemsInPickerView(pickerView: AKPickerView) -> Int {
        return self.titles.count
    }
    
    func pickerView(pickerView: AKPickerView, titleForItem item: Int) -> String {
        return self.titles[item]
    }
    
    func pickerView(pickerView: AKPickerView, imageForItem item: Int) -> UIImage {
        return UIImage(named: self.titles[item])!
    }
    
    func pickerView(pickerView: AKPickerView, didSelectItem item: Int) {
        print("Your favorite city is \(self.titles[item])")
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {}
    
}





