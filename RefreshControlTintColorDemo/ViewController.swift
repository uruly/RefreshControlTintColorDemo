//
//  ViewController.swift
//  RefreshControlTintColorDemo
//
//  Created by Reona Kubo on 2019/04/15.
//  Copyright © 2019 Reona Kubo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func onTapSuccessButton(_ sender: UIButton) {
        let successVC = SuccessViewController()
        navigationController?.pushViewController(successVC, animated: true)
    }
    
    @IBAction func onTapFailureButton1(_ sender: UIButton) {
        let failureVC = FailureViewController()
        navigationController?.pushViewController(failureVC, animated: true)
    }
}
