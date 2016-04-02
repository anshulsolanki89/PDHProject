//
//  PDHUtilityExtension.swift
//  PDH
//
//  Created by Ellan Jesse on 11/27/15.
//  Copyright © 2015 Ellan Jesse. All rights reserved.
//

import UIKit

extension UIImage {
    func renderedImage() -> UIImage {
        return imageWithRenderingMode(.AlwaysTemplate)
    }
}