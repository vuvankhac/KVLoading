//
//  KVLoading.swift
//
//  Created by Vu Van Khac on 2/22/17.
//

import UIKit

public class KVLoading: UIView {
    
    class var shared: KVLoading {
        struct Static {
            static let shared = KVLoading()
        }
        
        return Static.shared
    }
    
    public private(set) var isShowing: Bool {
        get {
            guard let contentView = self.contentView else {
                return false
            }
            
            if contentView.alpha > 0 {
                return true
            } else {
                return false
            }
        }
        
        set {
            self.isShowing = newValue
        }
    }
    
    lazy var keyView: UIView = {
        if let view = UIApplication.shared.keyWindow {
            return view
        }
        
        return UIView()
    }()
    
    var backgroundView: UIView?
    var contentView: UIView?
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func didChangeStatusBarOrientation(notifitation: Notification) {
        guard let contentView = self.contentView else {
            return
        }
        
        contentView.center = keyView.center
    }
    
    public static func show(_ customView: UIView? = nil, animated: Bool = true) {
        self.shared.show(customView, animated: animated)
    }
    
    func show(_ customView: UIView? = nil, animated: Bool = true) {
        if isShowing {
            return
        }
        
        backgroundView = UIView()
        if let backgroundView = backgroundView {
            backgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            backgroundView.frame = keyView.bounds
            backgroundView.isUserInteractionEnabled = true
            backgroundView.backgroundColor = .black
            keyView.addSubview(backgroundView)
            
            backgroundView.alpha = 0
            UIView.animate(withDuration: 0.3, animations: {
                backgroundView.alpha = 0.2
            })
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.didChangeStatusBarOrientation(notifitation:)), name: NSNotification.Name.UIApplicationDidChangeStatusBarOrientation, object: nil)
        if let customView = customView {
            customView.translatesAutoresizingMaskIntoConstraints = false
            contentView = customView
        } else {
            contentView = KVLoadingView()
        }
        
        guard let contentView = self.contentView else {
            return
        }
        
        contentView.alpha = 0
        contentView.center = keyView.center
        keyView.addSubview(contentView)
        if let customView = customView {
            let horizontalConstraint = NSLayoutConstraint(item: customView, attribute: .centerX, relatedBy: .equal, toItem: keyView, attribute: .centerX, multiplier: 1, constant: 0)
            let verticalConstraint = NSLayoutConstraint(item: customView, attribute: .centerY, relatedBy: .equal, toItem: keyView, attribute: .centerY, multiplier: 1, constant: 0)
            keyView.addConstraint(horizontalConstraint)
            keyView.addConstraint(verticalConstraint)
        }
        
        if animated {
            UIView.animate(withDuration: 0.3, animations: {
                contentView.alpha = 1
            })
        } else {
            contentView.alpha = 1
        }
    }
    
    public static func showInView(view: UIView, customView: UIView? = nil, animated: Bool = true) {
        self.shared.showInView(view: view, customView, animated: animated)
    }
    
    func showInView(view: UIView, _ customView: UIView? = nil, animated: Bool = true) {
        if isShowing {
            return
        }
        
        backgroundView = UIView()
        if let backgroundView = backgroundView {
            backgroundView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            backgroundView.frame = view.bounds
            backgroundView.isUserInteractionEnabled = true
            backgroundView.backgroundColor = .black
            view.addSubview(backgroundView)
            
            backgroundView.alpha = 0
            UIView.animate(withDuration: 0.3, animations: {
                backgroundView.alpha = 0.2
            })
        }
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.didChangeStatusBarOrientation(notifitation:)), name: NSNotification.Name.UIApplicationDidChangeStatusBarOrientation, object: nil)
        if let customView = customView {
            customView.translatesAutoresizingMaskIntoConstraints = false
            contentView = customView
        } else {
            contentView = KVLoadingView()
        }
        
        guard let contentView = self.contentView else {
            return
        }
        
        contentView.alpha = 0
        contentView.center = view.center
        view.addSubview(contentView)
        if let customView = customView {
            let horizontalConstraint = NSLayoutConstraint(item: customView, attribute: .centerX, relatedBy: .equal, toItem: keyView, attribute: .centerX, multiplier: 1, constant: 0)
            let verticalConstraint = NSLayoutConstraint(item: customView, attribute: .centerY, relatedBy: .equal, toItem: keyView, attribute: .centerY, multiplier: 1, constant: 0)
            keyView.addConstraint(horizontalConstraint)
            keyView.addConstraint(verticalConstraint)
        }
        
        if animated {
            UIView.animate(withDuration: 0.3, animations: {
                contentView.alpha = 1
            })
        } else {
            contentView.alpha = 1
        }
    }
    
    public static func hide(animated: Bool = true) {
        self.shared.hide(animated: animated)
    }
    
    func hide(animated: Bool = true) {
        if !isShowing {
            return
        }
        
        if animated {
            UIView.animate(withDuration: 0.3, animations: {
                self.backgroundView?.alpha = 0
                self.contentView?.alpha = 0
            }, completion: { _ in
                self.backgroundView?.removeFromSuperview()
                self.contentView?.removeFromSuperview()
                self.backgroundView = nil
                self.contentView = nil
                NotificationCenter.default.removeObserver(self)
            })
        } else {
            backgroundView?.removeFromSuperview()
            contentView?.removeFromSuperview()
            backgroundView = nil
            contentView = nil
            NotificationCenter.default.removeObserver(self)
        }
    }
    
}

class KVLoadingView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.addSubview(self.contentView())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func contentView() -> UIView {
        let contentView: UIView = UIView()
        contentView.frame.size.width = 77
        contentView.frame.size.height = 77
        contentView.center = self.center
        contentView.backgroundColor = UIColor.black.withAlphaComponent(0.7)
        contentView.layer.cornerRadius = 5
        
        let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator.frame.size.width = 37
        activityIndicator.frame.size.height = 37
        activityIndicator.center = CGPoint(x: contentView.frame.width / 2, y: contentView.frame.height / 2)
        activityIndicator.activityIndicatorViewStyle = .whiteLarge
        activityIndicator.startAnimating()
        contentView.addSubview(activityIndicator)
        
        return contentView
    }
    
}
