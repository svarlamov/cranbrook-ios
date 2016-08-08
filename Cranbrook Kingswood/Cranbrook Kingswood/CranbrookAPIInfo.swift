////
////  SEARCH_VIEW_CONTROLLER
////  Cranbrook
////
////  Created by Stefan DeClerck on 12/20/15.
////  Copyright © 2015 stefandeclerck. All rights reserved.
////
//
//import UIKit
//import Foundation
//import Alamofire
//import SwiftyJSON
//
//class SearchViewController: UITableViewController, UISearchBarDelegate {
//
//    @IBOutlet weak var searchBar: UISearchBar!
//
//    var searchResult: [SearchResult]? = [SearchResult]()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        searchBar.showsScopeBar = true
//        searchBar.delegate = self
//
//        self.tableView.separatorStyle = .SingleLine
//
//    }
//
//    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
//
//        resignFirstResponder()
//
//    }
//
//    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
//
//        searchBar.resignFirstResponder()
//        print("searched: \(searchBar.text!)")
//
//        login("", password: "", searchString: "\(searchBar.text!)")
//
//    }
//
//    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//        return searchResult!.count
//    }
//
//    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//
//        tableView.deselectRowAtIndexPath(indexPath, animated: true)
//
//    }
//
//    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//
//        let cell = tableView.dequeueReusableCellWithIdentifier("SearchCell", forIndexPath: indexPath) as! SearchTableViewCell
//
//
//        let finalString: String = "\(searchResult![indexPath.row].firstName) \(searchResult![indexPath.row].lastName), \(searchResult![indexPath.row].gradYear)"
//        cell.mainLabel.text = finalString
//
//        if searchResult?[indexPath.row].email == "" {
//
//            cell.emailLabel.text = "--"
//
//        } else {
//
//            cell.emailLabel.text = searchResult![indexPath.row].email
//
//        }
//
//        return cell
//    }
//
//    func search(searchTerm: String) {
//
//        searchResult?.removeAll()
//
//        var finalSearchQuery: String = String()
//
//        for objects in searchTerm.characters {
//
//            if objects == " " {
//
//                finalSearchQuery = finalSearchQuery + "+"
//
//            } else {
//
//                finalSearchQuery = finalSearchQuery + "\(objects)"
//
//            }
//
//        }
//
//        print(finalSearchQuery)
//
//        Alamofire.request(.GET, "https://cranbrook.myschoolapp.com/api/directory/directoryresultsget?directoryId=449&searchVal=\(finalSearchQuery)&facets=&searchAll=false").responseJSON { response in
//
//            var instanceSearchResult: SearchResult!
//
//            for object in JSON(response.result.value!) {
//
//                let firstName: String! = object.1["FirstName"].stringValue
//                let lastName: String! = object.1["LastName"].stringValue
//                let email: String! = object.1["Email"].stringValue
//                let largeFilename: String! = object.1["LargeFileName"].stringValue
//                let addressLine1: String! = object.1["AddressLine1"].stringValue
//                let city: String! = object.1["City"].stringValue
//                let state: String! = object.1["State"].stringValue
//                let zip: String! = object.1["Zip"].stringValue
//                let homePhone: String! = object.1["HomePhone"].stringValue
//                let gradYear: String! = object.1["GradYear"].stringValue
//                let gradeDisplay: String! = object.1["GradeDisplay"].stringValue
//                let gradeNumericDisplay: String! = object.1["GradeNumericDisplay"].stringValue
//
//                instanceSearchResult = SearchResult(firstName: firstName, lastName: lastName, email: email, largeFilename: largeFilename, addressLine1: addressLine1, city: city, state: state, zip: zip, homePhone: homePhone, gradYear: gradYear, gradeDisplay: gradeDisplay, gradeNumericDisplay: gradeNumericDisplay)
//
//                print(instanceSearchResult)
//                self.searchResult?.append(instanceSearchResult)
//
//                self.tableView.reloadData()
//
//            }
//
//        }
//
//        ProgressHUD.showSuccess("Done")
//        print("search conplete")
//
//    }
//
//    func login(username: String, password: String, searchString: String) {
//
//        ProgressHUD.show("Loading")
//
//        Alamofire.request(.POST, "https://cranbrook.myschoolapp.com/api/SignIn", parameters: ["From": "", "Username": "\(username)", "Password": "\(password)", "remember": false, "InterfaceSource": "WebApp"], encoding: .JSON, headers: ["Content-Type": "application/json", "Accept": "application/json, text/javascript, */*; q=0.01", "Cookie": "ASP.NET_SessionId=3ehspjh5c1uqhlyrj1tjne25; bridge=action=destroy&src=webapp&xdb=false; rxVisitor=1444443613992KPVQJHAQ91K2GFE91ILTIO2H2SSGRVFG; dtCookie=6$665AEE1806B4356104CA41593EA443DA|SimpleServer-App|1; dtCookie=6$665AEE1806B4356104CA41593EA443DA|SimpleServer-App|1; dtLatC=1; rxVT=1444486348600; dtPC=6$284526274_105h4vHCBNJVCOHEPGHECFEATKCGHMBJIAAHIR"]).responseJSON { response in
//
//            if let json: JSON = JSON(response.result.value!) {
//
//                let studentID = json["CurrentUserForExpired"].stringValue
//                userId = studentID
//
//            }
//
//            let isSuccessful = JSON(response.result.value!)["LoginSuccessful"].boolValue
//
//            switch isSuccessful {
//
//            case true:
//                print("LoginSuccessful")
//                self.search(searchString)
//
//            case false:
//                ProgressHUD.showError("Error")
//                print("LoginUnsuccessful")
//
//            }
//
//        }
//
//    }
//
//}
//
// ----------------------------------------------------------------------------------------------------------------------------------------------
//
////
////  CLASSES_COLLECTION_VIEW
////  Cranbrook
////
////  Created by Stefan DeClerck on 12/19/15.
////  Copyright © 2015 stefandeclerck. All rights reserved.
////
//
//import UIKit
//import Foundation
//import Alamofire
//import SwiftyJSON
//
//class ClassesCollectionView: UICollectionViewController, CollectionViewWaterfallLayoutDelegate {
//
//    let reuseIdentifier = "ClassCell"
//    let cellSize = CGSize(width: 200, height: 41)
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        let layout = CollectionViewWaterfallLayout()
//        layout.sectionInset = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
//        layout.headerInset = UIEdgeInsetsMake(3, 0, 0, 0)
//        layout.headerHeight = 2
//        layout.footerHeight = 5
//        layout.minimumColumnSpacing = 10
//        layout.minimumInteritemSpacing = 10
//
//        collectionView!.collectionViewLayout = layout
//        collectionView!.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: CollectionViewWaterfallElementKindSectionHeader, withReuseIdentifier: "Header")
//        collectionView!.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: CollectionViewWaterfallElementKindSectionFooter, withReuseIdentifier: "Footer")
//
//    }
//
//    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ClassesCollectionViewCell
//
//        cell.layer.cornerRadius = 6
//        cell.classGrade.text = studentClasses[indexPath.item].cumGrade
//        cell.classSubjectName.text = studentClasses[indexPath.item].sectionidentifier
//        cell.classTeacherName.text = studentClasses[indexPath.item].groupOwnerName
//
//        return cell
//    }
//
//    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        return studentClasses.count
//    }
//
//    func collectionView(collectionView: UICollectionView, layout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//
//        return cellSize
//
//    }
//
//    func getClasses(studentId: String) {
//
//        Alamofire.request(.GET, "https://cranbrook.myschoolapp.com/api/datadirect/ParentStudentUserAcademicGroupsGet?userId=\(studentId)&schoolYearLabel=2015+-+2016&memberLevel=3&persona=2&durationList=51376&markingPeriodId=").responseJSON { response in
//
//            for object in JSON(response.result.value!) {
//
//                let sectionId: NSNumber = object.1["sectionid"].numberValue
//                let sectionIdentifier: String = object.1["sectionidentifier"].stringValue
//                var cumGrade: String = object.1["cumgrade"].stringValue
//                let markingPeriodId: NSNumber = object.1["markingperiodid"].numberValue
//                let groupOwnerEmail: String = object.1["groupowneremail"].stringValue
//                let groupOwnerName: String = object.1["groupownername"].stringValue
//
//                if cumGrade == "" {
//
//                    cumGrade = "--"
//
//                }
//
//                let instanceClass: Class = Class(sectionId: sectionId, sectionIdentifier: sectionIdentifier, cumGrade: cumGrade, markingPeriodId: markingPeriodId, groupOwnerEmail: groupOwnerEmail, groupOwnerName: groupOwnerName, gradeBook: [])
//
//                studentClasses.append(instanceClass)
//
//                print(studentClasses)
//
//                self.collectionView?.reloadData()
//
//            }
//
//            ProgressHUD.showSuccess("Done")
//
//        }
//
//    }
//
//    func login(username: String, password: String) {
//
//        ProgressHUD.show("Loading")
//
//        Alamofire.request(.POST, "https://cranbrook.myschoolapp.com/api/SignIn", parameters: ["From": "", "Username": "\(username)", "Password": "\(password)", "remember": false, "InterfaceSource": "WebApp"], encoding: .JSON, headers: ["Content-Type": "application/json", "Accept": "application/json, text/javascript, */*; q=0.01", "Cookie": "ASP.NET_SessionId=3ehspjh5c1uqhlyrj1tjne25; bridge=action=destroy&src=webapp&xdb=false; rxVisitor=1444443613992KPVQJHAQ91K2GFE91ILTIO2H2SSGRVFG; dtCookie=6$665AEE1806B4356104CA41593EA443DA|SimpleServer-App|1; dtCookie=6$665AEE1806B4356104CA41593EA443DA|SimpleServer-App|1; dtLatC=1; rxVT=1444486348600; dtPC=6$284526274_105h4vHCBNJVCOHEPGHECFEATKCGHMBJIAAHIR"]).responseJSON { response in
//
//            if let json: JSON = JSON(response.result.value!) {
//
//                let studentID = json["CurrentUserForExpired"].stringValue
//                userId = studentID
//
//            }
//
//            let isSuccessful = JSON(response.result.value!)["LoginSuccessful"].boolValue
//
//            switch isSuccessful {
//
//            case true:
//                print("LoginSuccessful")
//                self.getClasses(userId)
//
//            case false:
//                ProgressHUD.showError("Error")
//                print("LoginUnsuccessful")
//
//            }
//
//        }
//
//    }
//
//}
//
// ----------------------------------------------------------------------------------------------------------------------------------------------
//
//  ASSIGNMENT_TYPE_ID
//
//enum assignmentType: Int {
//
//    case Test = 637
//    case Participation = 1638
//    case Quiz = 636
//    case Homework = 645
//    case EssayOrPaper = 641
//
//}
//
//
// ----------------------------------------------------------------------------------------------------------------------------------------------
//
////
////  CLASSES_COLLECTION_VIEW
////  Cranbrook
////
////  Created by Stefan DeClerck on 12/19/15.
////  Copyright © 2015 stefandeclerck. All rights reserved.
////
//
//import UIKit
//import Foundation
//import Alamofire
//import SwiftyJSON
//
//class ClassesCollectionView: UICollectionViewController, CollectionViewWaterfallLayoutDelegate {
//
//    let reuseIdentifier = "ClassCell"
//    let cellSize = CGSize(width: 200, height: 41)
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//        let layout = CollectionViewWaterfallLayout()
//        layout.sectionInset = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
//        layout.headerInset = UIEdgeInsetsMake(3, 0, 0, 0)
//        layout.headerHeight = 2
//        layout.footerHeight = 5
//        layout.minimumColumnSpacing = 10
//        layout.minimumInteritemSpacing = 10
//
//        collectionView!.collectionViewLayout = layout
//        collectionView!.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: CollectionViewWaterfallElementKindSectionHeader, withReuseIdentifier: "Header")
//        collectionView!.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: CollectionViewWaterfallElementKindSectionFooter, withReuseIdentifier: "Footer")
//
//    }
//
//    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
//
//        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ClassesCollectionViewCell
//
//        cell.layer.cornerRadius = 6
//        cell.classGrade.text = studentClasses[indexPath.item].cumGrade
//        cell.classSubjectName.text = studentClasses[indexPath.item].sectionidentifier
//        cell.classTeacherName.text = studentClasses[indexPath.item].groupOwnerName
//
//        return cell
//    }
//
//    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//
//        return studentClasses.count
//    }
//
//    func collectionView(collectionView: UICollectionView, layout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//
//        return cellSize
//
//    }
//
//    func getClasses(studentId: String) {
//
//        Alamofire.request(.GET, "https://cranbrook.myschoolapp.com/api/datadirect/ParentStudentUserAcademicGroupsGet?userId=\(studentId)&schoolYearLabel=2015+-+2016&memberLevel=3&persona=2&durationList=51376&markingPeriodId=").responseJSON { response in
//
//            for object in JSON(response.result.value!) {
//
//                let sectionId: NSNumber = object.1["sectionid"].numberValue
//                let sectionIdentifier: String = object.1["sectionidentifier"].stringValue
//                var cumGrade: String = object.1["cumgrade"].stringValue
//                let markingPeriodId: NSNumber = object.1["markingperiodid"].numberValue
//                let groupOwnerEmail: String = object.1["groupowneremail"].stringValue
//                let groupOwnerName: String = object.1["groupownername"].stringValue
//
//                if cumGrade == "" {
//
//                    cumGrade = "--"
//
//                }
//
//                let instanceClass: Class = Class(sectionId: sectionId, sectionIdentifier: sectionIdentifier, cumGrade: cumGrade, markingPeriodId: markingPeriodId, groupOwnerEmail: groupOwnerEmail, groupOwnerName: groupOwnerName, gradeBook: [])
//
//                studentClasses.append(instanceClass)
//
//                print(studentClasses)
//
//                self.collectionView?.reloadData()
//
//            }
//
//            ProgressHUD.showSuccess("Done")
//
//        }
//
//    }
//
//    func login(username: String, password: String) {
//
//        ProgressHUD.show("Loading")
//
//        Alamofire.request(.POST, "https://cranbrook.myschoolapp.com/api/SignIn", parameters: ["From": "", "Username": "\(username)", "Password": "\(password)", "remember": false, "InterfaceSource": "WebApp"], encoding: .JSON, headers: ["Content-Type": "application/json", "Accept": "application/json, text/javascript, */*; q=0.01", "Cookie": "ASP.NET_SessionId=3ehspjh5c1uqhlyrj1tjne25; bridge=action=destroy&src=webapp&xdb=false; rxVisitor=1444443613992KPVQJHAQ91K2GFE91ILTIO2H2SSGRVFG; dtCookie=6$665AEE1806B4356104CA41593EA443DA|SimpleServer-App|1; dtCookie=6$665AEE1806B4356104CA41593EA443DA|SimpleServer-App|1; dtLatC=1; rxVT=1444486348600; dtPC=6$284526274_105h4vHCBNJVCOHEPGHECFEATKCGHMBJIAAHIR"]).responseJSON { response in
//
//            if let json: JSON = JSON(response.result.value!) {
//
//                let studentID = json["CurrentUserForExpired"].stringValue
//                userId = studentID
//
//            }
//
//            let isSuccessful = JSON(response.result.value!)["LoginSuccessful"].boolValue
//
//            switch isSuccessful {
//
//            case true:
//                print("LoginSuccessful")
//                self.getClasses(userId)
//
//            case false:
//                ProgressHUD.showError("Error")
//                print("LoginUnsuccessful")
//
//            }
//
//        }
//
//    }
//
//}