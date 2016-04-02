//
//  PDHOverlayView.swift
//  PDH
//
//  Created by Ellan Jesse on 12/13/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

protocol PDHOverlayViewDelegate: class {
    func overlayViewClicked(overlayView: PDHOverlayView)
}

class PDHOverlayView: UIView {

    weak var delegate: PDHOverlayViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.blackColor()
        self.alpha = 0.8
        
        let tapGesture = UITapGestureRecognizer(
            target: self,
            action: "overlayViewClicked:")
        self.addGestureRecognizer(tapGesture)
    }

    func overlayViewClicked(tapGesture: UITapGestureRecognizer) {
        delegate?.overlayViewClicked(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}