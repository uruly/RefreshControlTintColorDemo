//
//  FailureViewController.swift
//  RefreshControlTintColorDemo
//
//  Created by Reona Kubo on 2019/04/15.
//  Copyright © 2019 Reona Kubo. All rights reserved.
//

import UIKit

class FailureViewController: UIViewController {

    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            collectionView.delegate = self
            collectionView.dataSource = self
            collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
            let refreshControl = UIRefreshControl()
            refreshControl.tintColor = .white
            refreshControl.addTarget(self, action: #selector(handleRefreshControl(_:)), for: .valueChanged)
            collectionView.refreshControl = refreshControl
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let refreshControl = collectionView.refreshControl, !refreshControl.isRefreshing else {
            return
        }
        refreshControl.beginRefreshing()
        UIView.animate(withDuration: 0.25, delay: 0, options: .curveEaseInOut, animations: { [weak self] in
            self?.collectionView.contentOffset.y = -refreshControl.bounds.height
            }, completion: { (_) in
                refreshControl.sendActions(for: .valueChanged)
        })
    }

    @objc private func handleRefreshControl(_ sender: UIRefreshControl) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.collectionView.refreshControl?.endRefreshing()
        }
    }

}

// MARK: - UICollectionViewDataSouce

extension FailureViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        cell.contentView.backgroundColor = UIColor.blue
        return cell
    }

}

// MARK: - UICollectionViewDelegate

extension FailureViewController: UICollectionViewDelegate {}
