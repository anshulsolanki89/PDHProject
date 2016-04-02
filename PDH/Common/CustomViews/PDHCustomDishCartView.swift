//
//  PDHCustomDishCartView.swift
//  PDH
//
//  Created by Ellan Jesse on 12/26/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import Foundation
import UIKit

class PDHCustomDishCartView: UIView {
  
    @IBOutlet weak var dishCount: UILabel!
    @IBOutlet weak var totalPrice: UILabel!

    class func instanceFromNib() -> UIView {
        return UINib(nibName: "PDHCustomDishCartView", bundle: nil).instantiateWithOwner(nil, options: nil)[0] as! UIView
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

//    override init(frame: CGRect) {
//        super.init(frame: frame)
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//    }

    func changeQuantity(quantity: Int) {
        dishCount.text = String(quantity) + " dishes in your order"
    }

    func changeTotalPrice(total: Int) {
        let priceString = "Rs. " + "\(total)"
        let attributedString = NSMutableAttributedString(string: priceString)
        attributedString.addAttributes(
            [NSFontAttributeName: PDHHelper.getSkiaRegularFont(16.0),
                NSForegroundColorAttributeName: UIColor.rgb(174, g: 174, b: 174, α: 1)],
            range: NSMakeRange(0, 3))
        attributedString.addAttributes(
            [NSFontAttributeName: PDHHelper.getSkiaRegularFont(18.0),
            NSForegroundColorAttributeName: UIColor.rgb(255, g: 196, b: 18, α: 1)],
            range: NSMakeRange(3, (attributedString.length - 3)))
        totalPrice.attributedText = attributedString
    }
}