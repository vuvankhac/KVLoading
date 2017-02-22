//
//  CustomView.swift
//  KVLoading
//
//  Created by Vu Van Khac on 2/22/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class CustomView: UIView {

    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        indicatorView.startAnimating()
    }

}

extension UIView {
    
    static func nibName() -> String {
        let nameSpaceClassName = NSStringFromClass(self)
        let className = nameSpaceClassName.components(separatedBy: ".").last! as String
        return className
    }
    
    static func loadFromNib<T: UIView>() -> T {
        let nibName = "\(self)".characters.split { $0 == "." }.map(String.init).last!
        let nib = UINib(nibName: nibName, bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! T
    }
    
}
