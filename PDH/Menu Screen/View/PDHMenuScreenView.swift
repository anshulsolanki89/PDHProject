//
//  PDHMenuScreenView.swift
//  PDH
//
//  Created by Anshul Solanki on 12/2/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit
import AFNetworking

class PDHMenuScreenView: PDHView {
    
    private var isSliderVisible = false
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var dishSearchTableView: UIView!
    @IBOutlet weak var dishSearchBar: UISearchBar!
    
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var userBGImageView: UIImageView!
    
    @IBOutlet weak var dishOfWeekLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
   
    private var overlayView: PDHOverlayView!
    private var dataArray = [PDHDishcategoryMenu]()
   
    private var dishNamesArray = [
        "Chinese",
        "Tandoori",
        "Biryani",
        "Main Course",
        "Snacks Fish",
        "Fast Food"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        createOverlayView()
        searchBarUI()
        addNotificationObserver()
    }
    
    @IBAction func menuBtnClicked(sender: AnyObject) {
        endSearching()
        delegate?.viewDidPerformAction(ViewActions.MenuBtnClciked, data: nil)
    }
    
    @IBAction func addToOrderBtnClciked(sender: AnyObject) {

    }
   
    func updateData(data: AnyObject) {
        if let data = data as? PDHDishDataObject {
            dishOfWeekLabel.text = data.title
        } else if let data = data as? PDHLoginInfoDataObject {
            userNameLabel.text = "Hello " + "\(data.name)"
        } else if let data = data as? [PDHDishcategoryMenu] {
            dataArray = data
            collectionView.reloadData()
        }
    }
    
    func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.CGRectValue() {
            overlayView.removeFromSuperview()
            overlayView.frame = CGRect(x: 0,
                y: 108,
                width: self.frame.size.width,
                height: (self.frame.size.height - keyboardSize.height - 108))
        }
    }
    
    func keyboardWillHide(notification: NSNotification) {
        //TODO:- check whether this notification is required or not
    }
    
    func keyboardDidShow(notification: NSNotification) {
        self.addSubview(overlayView)
    }
    
    deinit {
        removeNotificationObserver()
        print("\(self) DEALLOCATED")
    }
}

// MARK:- CollectionViewDataSource
extension PDHMenuScreenView: UICollectionViewDataSource {

    func collectionView(collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
            return dataArray.count
    }
    
    func collectionView(collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier(
                "PDHMenuOptionsCell",
                forIndexPath: indexPath) as! PDHMenuOptionsCell
            
            cell.menuOptionImageView.setImageWithURL(NSURL(
                string: dataArray[indexPath.row].categoryImageURL)!)
            cell.menuOptionLabel.text = dataArray[indexPath.row].dishCategory
            
            return cell
    }
}

// MARK:- Search Bar Delegate
extension PDHMenuScreenView: UISearchBarDelegate {
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        searchBar.setShowsCancelButton(true, animated: true)
        return true
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBarChangedState(searchBar)
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        endSearching()
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        print("change \(searchBar.text)")
        searchBarChangedState(searchBar)
    }
    
    func searchBarChangedState(searchBar: UISearchBar) {
        if searchBar.text != "" {
            hideOverlayView()
        } else {
            showOverlayView()
        }
    }
}

// MARK:- Private methods
extension PDHMenuScreenView {
    private func createOverlayView() {
        overlayView = PDHOverlayView(frame: CGRect(
            x: 0,
            y: 108,
            width: self.frame.size.width,
            height: self.frame.size.height - 108))
        overlayView.delegate = self
    }
    
    private func addNotificationObserver() {
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "keyboardWillShow:",
            name: UIKeyboardWillShowNotification,
            object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "keyboardDidShow:",
            name: UIKeyboardDidShowNotification,
            object: nil)
        NSNotificationCenter.defaultCenter().addObserver(self,
            selector: "keyboardWillHide:",
            name: UIKeyboardWillHideNotification,
            object: nil)
    }
    
    private func searchBarUI() {
        let cancelBtnAttributes =
        [NSFontAttributeName: PDHHelper.getSkiaRegularFont(16),
            NSForegroundColorAttributeName: PDHHelper.getCancelBtnColor()]
        UIBarButtonItem.appearance().setTitleTextAttributes(
            cancelBtnAttributes,
            forState: UIControlState.Normal)
        
        if #available(iOS 9.0, *) {
            UITextField.appearanceWhenContainedInInstancesOfClasses([UISearchBar.self]).font =
                PDHHelper.getSkiaRegularFont(16)
            UITextField.appearanceWhenContainedInInstancesOfClasses([UISearchBar.self]).textColor =
                PDHHelper.getCancelBtnColor()
        } else {
            // Fallback on earlier versions
        }
    }

    private func hideOverlayView() {
        overlayView.removeFromSuperview()
        dishSearchTableView.hidden = false
        self.bringSubviewToFront(dishSearchTableView)
    }
    
    private func showOverlayView() {
        self.addSubview(overlayView)
        dishSearchTableView.hidden = true
    }
    
    
    private func endSearching() {
        dishSearchBar.text = ""
        dishSearchBar.setShowsCancelButton(false, animated: true)
        overlayView.removeFromSuperview()
        if dishSearchBar.canResignFirstResponder() {
            dishSearchBar.resignFirstResponder()
        }
        dishSearchTableView.hidden = true
        self.bringSubviewToFront(dishSearchTableView)
    }
    
    private func removeNotificationObserver() {
        NSNotificationCenter.defaultCenter().removeObserver(self,
            name: UIKeyboardWillShowNotification,
            object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self,
            name: UIKeyboardWillHideNotification,
            object: nil)
    }
}

extension PDHMenuScreenView: PDHOverlayViewDelegate {
    func overlayViewClicked(overlayView: PDHOverlayView) {
        endSearching()
    }
}