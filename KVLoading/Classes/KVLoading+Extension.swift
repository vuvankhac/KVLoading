//
//  KVLoading+Extension.swift
//  KVLoading
//
//  Created by Khac VU on 13/12/25.
//

import UIKit

public extension UIViewController {
    var visibleViewController: UIViewController {
        var viewController: UIViewController = self
        while let presentedViewController = viewController.presentedViewController {
            viewController = presentedViewController
        }
        return viewController
    }
    
    @MainActor
    @objc func showLoading(in view: UIView? = nil, timeout: Int = 66, animated: Bool = true) {
        if timeout > 0 {
            UIView.cancelPreviousPerformRequests(withTarget: self, selector: #selector(hideLoading(animated:)), object: nil)
            perform(#selector(self.hideLoading(animated:)), with: nil, afterDelay: TimeInterval(timeout))
        }
        if let unwrappedView = view {
            KVLoading.shared.show(in: unwrappedView, animated: animated)
        } else if let unwrappedView = UIApplication.shared.connectedScenes
            .compactMap({ $0 as? UIWindowScene })
            .flatMap({ $0.windows })
            .first(where: { $0.isKeyWindow })?
            .rootViewController?
            .visibleViewController
            .view {
            KVLoading.shared.show(in: unwrappedView, animated: animated)
        }
    }
    
    @MainActor
    @objc func hideLoading(animated: Bool = true) {
        UIView.cancelPreviousPerformRequests(withTarget: self, selector: #selector(hideLoading(animated:)), object: nil)
        KVLoading.shared.hide(animated: animated)
    }
}
