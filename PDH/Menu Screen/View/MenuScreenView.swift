//
//  MenuScreenView.swift
//  PDH
//
//  Created by Anshul Solanki on 12/2/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import Foundation
import UIKit

class MenuScreenView: PDHView, UICollectionViewDataSource, UISearchBarDelegate {
    
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
        delegate?.viewPerformedAction(ViewActions.MenuBtnClciked)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
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
 
        overlayView = PDHOverlayView(frame: CGRect(x: 0,
            y: 108,
            width: self.frame.size.width,
            height: self.frame.size.height - 108))
        overlayView.delegate = self
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
    
    // MARK:- Search Bar Delegate
    func searchBarShouldBeginEditing(searchBar: UISearchBar) -> Bool {
        return true
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        
    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
        overlayView.removeFromSuperview()
        dishSearchTableView.hidden = true
        searchBar.resignFirstResponder()
        
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        print("change \(searchBar.text)")
        if searchBar.text != "" {
            overlayView.removeFromSuperview()
            dishSearchTableView.hidden = false
            self.bringSubviewToFront(dishSearchTableView)
        } else {
            self.addSubview(overlayView)
            dishSearchTableView.hidden = true
        }
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self,
            name: UIKeyboardWillShowNotification,
            object: nil)
        NSNotificationCenter.defaultCenter().removeObserver(self,
            name: UIKeyboardWillHideNotification,
            object: nil)
        print("\(self) DEALLOCATED")
    }
}

extension MenuScreenView: PDHOverlayViewDelegate {
    func overlayViewClicked(overlayView: PDHOverlayView) {
        
    }
}