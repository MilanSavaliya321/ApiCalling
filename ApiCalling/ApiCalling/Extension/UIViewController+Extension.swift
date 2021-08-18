//
//  UIViewController+Extension.swift
//  Trichordal
//
//  Created by Sunil Zalavadiya on 23/01/19.
//  Copyright © 2019 Sunil Zalavadiya. All rights reserved.
//

import UIKit

extension UIViewController {
    // Not using static as it wont be possible to override to provide custom storyboardID then
    class public var storyboardID: String {
        return "\(self)"
    }

    static public func instantiate(fromAppStoryboard appStoryboard: AppStoryboard) -> Self {
        return appStoryboard.viewController(viewControllerClass: self)
    }
}
