//
//  BaseNavigationController.swift
//  BaseNavigationControllerDemo
//
//  Created by 王树军(金融壹账通客户端研发团队) on 2018/11/20.
//  Copyright © 2018 yzt. All rights reserved.

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension BaseNavigationController
{
    override func pushViewController(_ viewController: UIViewController, animated: Bool)
    {
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
        }
        super.pushViewController(viewController, animated: animated)
    }
}
