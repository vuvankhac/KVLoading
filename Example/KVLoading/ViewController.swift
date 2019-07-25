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
        // Extension.
        showLoading()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.hideLoading()
        }
    }
    
    @IBAction func showCustomLoadingAction(_ sender: Any?) {
        let customView: CustomView = CustomView.loadFromNib()
        showLoadingInView(view, customView: customView)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.hideLoading()
        }
    }
    
    @IBAction func showLoadingInViewAction(_ sender: Any?) {
        let customView: CustomView = CustomView.loadFromNib()
        showLoadingInView(containerView, customView: customView)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.hideLoading()
        }
    }
}

