//
//  UIScrollView+Refresh.swift
//  RefreshControlTintColorDemo
//
//  Created by Reona Kubo on 2019/04/15.
//  Copyright © 2019 Reona Kubo. All rights reserved.
//

import UIKit

extension UIScrollView {

    func beginRefreshing() {
        guard let refreshControl = refreshControl, !refreshControl.isRefreshing else {
            return
        }
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut, animations: { [weak self] in
            self?.contentOffset.y = -refreshControl.bounds.height
            }, completion: { (_) in
                refreshControl.beginRefreshing()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    refreshControl.sendActions(for: .valueChanged)
                }
        })
    }
}
