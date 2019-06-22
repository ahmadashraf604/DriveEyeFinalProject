//
//  NoDataMessageView.swift
//  DriveEye
//
//  Created by ashraf on 6/21/19.
//  Copyright © 2019 java. All rights reserved.
//

import Foundation
import UIKit
class NoDataMessageView{
    private static var emptyView :EmptyViewController?

    static func displayNoData(parent parentView:UIView) {
        if emptyView == nil{
            emptyView = EmptyViewController(nibName: "", bundle: nil)
        }
        parentView.addSubview((emptyView?.view)!)
        emptyView?.view.frame = CGRect(x:0, y: 0, width: parentView.frame.width, height: parentView.frame.height)
    }
    
//    static func removeNoData(parent parentView:UIView) {
//        emptyView?.removeFromParentViewController()
//    }
    
    
}
