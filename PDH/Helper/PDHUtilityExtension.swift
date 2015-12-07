//
//  PDHUtilityExtension.swift
//  PDH
//
//  Created by Anshul Solanki on 11/27/15.
//  Copyright © 2015 Anshul Solanki. All rights reserved.
//

import UIKit

extension UIImage {
    func renderedImage() -> UIImage {
        return imageWithRenderingMode(.AlwaysTemplate)
    }
}