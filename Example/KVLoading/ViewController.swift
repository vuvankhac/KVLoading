//
//  ViewController.swift
//  KVLoading
//
//  Created by vuvankhac on 02/22/2017.
//  Copyright (c) 2017 vuvankhac. All rights reserved.
//

import UIKit
import KVLoading

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showDefaultLoadingAction(_ sender: Any) {
        KVLoading.show()
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            KVLoading.hide()
        }
    }
    
    @IBAction func showCustomLoadingAction(_ sender: Any?) {
        let customView: CustomView = CustomView.loadFromNib()
        KVLoading.show(customView)
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            KVLoading.hide()
        }
    }
}

