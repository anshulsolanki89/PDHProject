//
//  MenuScreenView.swift
//  PDH
//
//  Created by Anshul Solanki on 12/2/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class MenuScreenView: PDHView, UICollectionViewDataSource {
    
    private var isSliderVisible = false
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var dishSearchTableView: UIView!
    @IBOutlet weak var dishSearchBar: UISearchBar!
    
    var overlayView: PDHOverlayView!
   
    private var dishNamesArray = [
        "Chinese",
        "Tandoori",
        "Biryani",
        "Main Course",
        "Snacks Fish",
        "Fast Food"]
    
    @IBAction func menuBtnClicked(sender: AnyObject) {
        endSearching()
        delegate?.viewDidPerformAction(ViewActions.MenuBtnClciked, data: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        createOverlayView()
        searchBarUI()
        addNotificationObserver()
    }
    
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
    
    // MARK:- CollectionView DataSource
    func collectionView(collectionView: UICollectionView,
        numberOfItemsInSection section: Int) -> Int {
        return 40
    }
    
    func collectionView(collectionView: UICollectionView,
        cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(
            "PDHMenuOptionsCell",
            forIndexPath: indexPath) as! PDHMenuOptionsCell
     
        cell.menuOptionImageView.image =
            UIImage(named: "\(indexPath.row % dishNamesArray.count).png")
        cell.menuOptionLabel.numberOfLines = 0
        cell.menuOptionLabel.lineBreakMode = .ByWordWrapping
        cell.menuOptionLabel.text =
            dishNamesArray[indexPath.row % dishNamesArray.count]
        
        return cell
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
    
    deinit {
        removeNotificationObserver()
        print("\(self) DEALLOCATED")
    }
}

// MARK:- Search Bar Delegate
extension MenuScreenView: UISearchBarDelegate {
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
    
    private func hideOverlayView() {
        overlayView.removeFromSuperview()
        dishSearchTableView.hidden = false
        self.bringSubviewToFront(dishSearchTableView)
    }
    
    private func showOverlayView() {
        self.addSubview(overlayView)
        dishSearchTableView.hidden = true
    }

}

extension MenuScreenView: PDHOverlayViewDelegate {
    func overlayViewClicked(overlayView: PDHOverlayView) {
        endSearching()
    }
}