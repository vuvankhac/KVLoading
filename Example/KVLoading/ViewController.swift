//
//  ViewController.swift
//

import UIKit
import KVLoading

class ViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func showDefaultLoadingAction(_ sender: Any) {
        showLoading()
    }
    
    @IBAction func showCustomLoadingAction(_ sender: Any?) {
    }
    
    @IBAction func showLoadingInViewAction(_ sender: Any?) {
        KVLoading.shared.show(in: containerView)
    }
}

