//
//  CustomView.swift
//  KVLoading
//
//  Created by Vu Van Khac on 2/22/17.
//  Copyright © 2017 CocoaPods. All rights reserved.
//

import UIKit

class CustomView: UIView {

    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet weak var title: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        indicatorView.startAnimating()
        title.text = "Wait a minute..."
    }
}
