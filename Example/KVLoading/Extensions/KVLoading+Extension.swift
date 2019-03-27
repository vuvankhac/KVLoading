//
//  KVLoading+Extension.swift
//

import UIKit
import KVLoading

extension UIViewController {
    private var masterView: UIView {
        if let navigationController = navigationController {
            return navigationController.view
        } else if let tabBarController = tabBarController {
            return tabBarController.view
        } else {
            return view
        }
    }
    
    @objc func showLoadingInView(_ view: UIView, timeout: Int = 60, customView: UIView? = nil, animated: Bool = true) {
        UIView.cancelPreviousPerformRequests(withTarget: self, selector: #selector(hideLoading(animated:)), object: nil)
        perform(#selector(hideLoading(animated:)), with: nil, afterDelay: TimeInterval(timeout))
        KVLoading.showInView(view: view, customView: customView, animated: animated)
    }
    
    @objc func showLoading(timeout: Int = 60, customView: UIView? = nil, animated: Bool = true) {
        showLoadingInView(masterView, timeout: timeout, customView: customView, animated: animated)
    }
    
    @objc func hideLoading(animated: Bool = true) {
        KVLoading.hide(animated: animated)
    }
}
