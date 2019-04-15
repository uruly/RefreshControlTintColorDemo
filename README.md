# UIRefreshControl tintColor is not work when called beginRefresing in viewDidAppear.

This project is demo.

https://uruly.xyz/begin-refreshing-not-changed-color/

## Issue

UIRefreshControl tintColor is not work when called beginRefresing in viewDidAppear.



GIF/refresh_failure.gif

## Solution

The reference is  `SuccessViewController`.


GIF/refresh_success.GIF

## Extension

This is my solution.

```
import UIKit

extension UIScrollView {

    func beginRefreshing() {
        guard let refreshControl = refreshControl, !refreshControl.isRefreshing else { return }
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
```

Please use it.

```
collectionView.beginRefresing()
tableView.beginRefresing()
```

