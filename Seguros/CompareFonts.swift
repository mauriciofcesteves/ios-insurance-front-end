//
//  CompareFonts.swift
//  Seguros
//
//  Created by Mauricio Esteves on 2018-03-20.
//  Copyright © 2018 Mauricio Esteves. All rights reserved.
//

import Foundation
import UIKit

/** A global font swatch for compare components. */
open class CompareFonts: NSObject {
    
    private static var defaultCellLabel : UIFont!
    
    /** The compare cell title font. */
    public static var cellLabel: UIFont {
        set {
            defaultCellLabel = newValue
        }
        get {
            if defaultCellLabel == nil {
                return UIFont.systemFont(ofSize: 14, weight: UIFont.Weight.regular)
            }
            return defaultCellLabel.withSize(14)
        }
    }
    
    private static var defaultCellValue : UIFont!
    
    /** The compare cell title font. */
    public static var cellValue: UIFont {
        set {
            defaultCellValue = newValue
        }
        get {
            if defaultCellValue == nil {
                return UIFont.systemFont(ofSize: 12, weight: UIFont.Weight.regular)
            }
            return defaultCellValue.withSize(12)
        }
    }
}
