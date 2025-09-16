//
//  KVLoading+Extension.swift
//  KVLoading
//
//  Created by Khac VU on 16/9/25.
//

import Foundation
import UIKit

public extension UIViewController {
    @objc func showLoading(in view: UIView? = nil, timeout: Int = 66, animated: Bool = true) {
        if timeout > 0 {
            UIView.cancelPreviousPerformRequests(withTarget: self, selector: #selector(hideLoading(animated:)), object: nil)
            perform(#selector(self.hideLoading(animated:)), with: nil, afterDelay: TimeInterval(timeout))
        }
        if let unwrappedView = view {
            KVLoading.shared.show(in: unwrappedView, animated: animated)
        } else if let windowScene = UIApplication.shared.connectedScenes.first(where: { $0 is UIWindowScene }) as? UIWindowScene,
                  let window = windowScene.windows.first(where: { $0.isKeyWindow }),
                  let rootViewController = window.rootViewController,
                  let unwrappedView = rootViewController.view {
            KVLoading.shared.show(in: unwrappedView, animated: animated)
        }
    }
    
    @objc func hideLoading(animated: Bool = true) {
        UIView.cancelPreviousPerformRequests(withTarget: self, selector: #selector(hideLoading(animated:)), object: nil)
        KVLoading.shared.hide(animated: animated)
    }
}
