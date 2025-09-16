//
//  KVLoading.swift
//  KVLoading
//
//  Created by Khac VU on 16/9/25.
//

import Foundation
import UIKit

public class KVLoading: NSObject {
    public static let shared = KVLoading()
    
    private var isShowLoading = false
    private var cachedBackgroundView: UIView?
    
    public func show(in view: UIView, animated: Bool = true) {
        if isShowLoading {
            return
        }
        isShowLoading = true
        
        let backgroundView = UIView()
        backgroundView.isUserInteractionEnabled = true
        backgroundView.backgroundColor = UIColor(white: 0.0, alpha: 0.3)
        view.addSubview(backgroundView)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
        
        let activityIndicatorView = UIActivityIndicatorView(style: .large)
        activityIndicatorView.color = UIColor(white: 1.0, alpha: 1.0)
        backgroundView.addSubview(activityIndicatorView)
        activityIndicatorView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            activityIndicatorView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            activityIndicatorView.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor, constant: -18.0),
        ])
        
        activityIndicatorView.startAnimating()
        if animated {
            backgroundView.alpha = 0.0
            UIView.animate(
                withDuration: 0.3,
                animations: {
                    backgroundView.alpha = 1.0
                }
            )
        } else {
            backgroundView.alpha = 1.0
        }
        
        cachedBackgroundView = backgroundView
    }
    
    public func hide(animated: Bool = true) {
        guard let backgroundView = cachedBackgroundView else { return }
        func completion(isFinished: Bool) {
            isShowLoading = false
            cachedBackgroundView?.removeFromSuperview()
            cachedBackgroundView = nil
        }
        if animated {
            UIView.animate(
                withDuration: 0.3,
                animations: {
                    backgroundView.alpha = 0.0
                },
                completion: completion(isFinished:)
            )
        } else {
            backgroundView.alpha = 0.0
            completion(isFinished: true)
        }
    }
}
