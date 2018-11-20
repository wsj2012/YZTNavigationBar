//
//  YZTCustomNavigationBar.swift
//  YZTNavigationBarDemo
//
//  Created by 王树军(金融壹账通客户端研发团队) on 2018/11/20.
//  Copyright © 2018 王树军(金融壹账通客户端研发团队). All rights reserved.
//

import UIKit

fileprivate let YZTDefaultTitleSize:CGFloat = 18
fileprivate let YZTDefaultTitleColor = UIColor.black
fileprivate let YZTDefaultBackgroundColor = UIColor.white
fileprivate let YZTScreenWidth = UIScreen.main.bounds.size.width

class YZTCustomNavigationBar: UIView {

    open var onClickLeftButton:(()->())?
    open var onClickRightButton:(()->())?
    open var title:String? {
        willSet {
            titleLabel.isHidden = false
            titleLabel.text = newValue
        }
    }
    open var titleLabelColor:UIColor? {
        willSet {
            titleLabel.textColor = newValue
        }
    }
    open var titleLabelFont:UIFont? {
        willSet {
            titleLabel.font = newValue
        }
    }
    open var barBackgroundColor:UIColor? {
        willSet {
            backgroundImageView.isHidden = true
            backgroundView.isHidden = false
            backgroundView.backgroundColor = newValue
        }
    }
    open var barBackgroundImage:UIImage? {
        willSet {
            backgroundView.isHidden = true
            backgroundImageView.isHidden = false
            backgroundImageView.image = newValue
        }
    }
    
    // fileprivate UI variable
    fileprivate lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.textColor = YZTDefaultTitleColor
        label.font = UIFont.systemFont(ofSize: YZTDefaultTitleSize)
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    fileprivate lazy var leftButton:UIButton = {
        let button = UIButton()
        button.imageView?.contentMode = .center
        button.isHidden = true
        button.addTarget(self, action: #selector(clickBack), for: .touchUpInside)
        return button
    }()
    
    fileprivate lazy var rightButton:UIButton = {
        let button = UIButton()
        button.imageView?.contentMode = .center
        button.isHidden = true
        button.addTarget(self, action: #selector(clickRight), for: .touchUpInside)
        return button
    }()
    
    fileprivate lazy var bottomLine:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: (218.0/255.0), green: (218.0/255.0), blue: (218.0/255.0), alpha: 1.0)
        return view
    }()
    
    fileprivate lazy var backgroundView:UIView = {
        let view = UIView()
        return view
    }()
    
    fileprivate lazy var backgroundImageView:UIImageView = {
        let imgView = UIImageView()
        imgView.isHidden = true
        return imgView
    }()
    

    fileprivate static var navBarBottom:Int {
        get {
            return YZTNavigationBar.isIphoneX() ? 88 : 64
        }
    }
    
    // init
    class func CustomNavigationBar() -> YZTCustomNavigationBar {
        let frame = CGRect(x: 0, y: 0, width: YZTScreenWidth, height: CGFloat(navBarBottom))
        return YZTCustomNavigationBar(frame: frame)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }
    
    func setupView()
    {
        addSubview(backgroundView)
        addSubview(backgroundImageView)
        addSubview(leftButton)
        addSubview(titleLabel)
        addSubview(rightButton)
        addSubview(bottomLine)
        updateFrame()
        backgroundColor = UIColor.clear
        backgroundView.backgroundColor = YZTDefaultBackgroundColor
    }
    func updateFrame()
    {
        let top:CGFloat = YZTNavigationBar.isIphoneX() ? 44 : 20
        let margin:CGFloat = 20
        let buttonHeight:CGFloat = 44
        let buttonWidth:CGFloat = 44
        let titleLabelHeight:CGFloat = 44
        let titleLabelWidth:CGFloat = 180
        
        backgroundView.frame = self.bounds
        backgroundImageView.frame = self.bounds
        leftButton.frame = CGRect(x: margin, y: top, width: buttonWidth, height: buttonHeight)
        rightButton.frame = CGRect(x: YZTScreenWidth-buttonWidth-margin, y: top, width: buttonWidth, height: buttonHeight)
        titleLabel.frame = CGRect(x: (YZTScreenWidth-titleLabelWidth)/2.0, y: top, width: titleLabelWidth, height: titleLabelHeight)
        bottomLine.frame = CGRect(x: 0, y: bounds.height-0.5, width: YZTScreenWidth, height: 0.5)
    }

}

extension YZTCustomNavigationBar
{
    public func yzt_setBottomLineHidden(hidden:Bool) {
        bottomLine.isHidden = hidden
    }
    public func yzt_setBackgroundAlpha(alpha:CGFloat) {
        backgroundView.alpha = alpha
        backgroundImageView.alpha = alpha
        bottomLine.alpha = alpha
    }
    public func yzt_setTintColor(color:UIColor) {
        leftButton.setTitleColor(color, for: .normal)
        rightButton.setTitleColor(color, for: .normal)
        titleLabel.textColor = color
    }
    
    // 左右按钮共有方法
    open func yzt_setLeftButton(normal:UIImage, highlighted:UIImage) {
        yzt_setLeftButton(normal: normal, highlighted: highlighted, title: nil, titleColor: nil)
    }
    open func yzt_setLeftButton(image:UIImage) {
        yzt_setLeftButton(normal: image, highlighted: image, title: nil, titleColor: nil)
    }
    open func yzt_setLeftButton(title:String, titleColor:UIColor) {
        yzt_setLeftButton(normal: nil, highlighted: nil, title: title, titleColor: titleColor)
    }
    
    open func yzt_setRightButton(normal:UIImage, highlighted:UIImage) {
        yzt_setRightButton(normal: normal, highlighted: highlighted, title: nil, titleColor: nil)
    }
    open func yzt_setRightButton(image:UIImage) {
        yzt_setRightButton(normal: image, highlighted: image, title: nil, titleColor: nil)
    }
    open func yzt_setRightButton(title:String, titleColor:UIColor) {
        yzt_setRightButton(normal: nil, highlighted: nil, title: title, titleColor: titleColor)
    }
    
    // 左右按钮私有方法
    private func yzt_setLeftButton(normal:UIImage?, highlighted:UIImage?, title:String?, titleColor:UIColor?) {
        leftButton.isHidden = false
        leftButton.setImage(normal, for: .normal)
        leftButton.setImage(highlighted, for: .highlighted)
        leftButton.setTitle(title, for: .normal)
        leftButton.setTitleColor(titleColor, for: .normal)
    }
    private func yzt_setRightButton(normal:UIImage?, highlighted:UIImage?, title:String?, titleColor:UIColor?) {
        rightButton.isHidden = false
        rightButton.setImage(normal, for: .normal)
        rightButton.setImage(highlighted, for: .highlighted)
        rightButton.setTitle(title, for: .normal)
        rightButton.setTitleColor(titleColor, for: .normal)
    }
}


// MARK: - 导航栏左右按钮事件
extension YZTCustomNavigationBar
{
    @objc func clickBack() {
        if let onClickBack = onClickLeftButton {
            onClickBack()
        } else {
            let currentVC = UIViewController.yzt_currentViewController()
            currentVC.yzt_toLastViewController(animated: true)
        }
    }
    @objc func clickRight() {
        if let onClickRight = onClickRightButton {
            onClickRight()
        }
    }
}

// MARK: - Router
extension UIViewController
{
    //  A页面 弹出 登录页面B
    //  presentedViewController:    A页面
    //  presentingViewController:   B页面
    
    open func yzt_toLastViewController(animated:Bool)
    {
        if self.navigationController != nil
        {
            if self.navigationController?.viewControllers.count == 1
            {
                self.dismiss(animated: animated, completion: nil)
            } else {
                self.navigationController?.popViewController(animated: animated)
            }
        }
        else if self.presentingViewController != nil {
            self.dismiss(animated: animated, completion: nil)
        }
    }
    
    open class func yzt_currentViewController() -> UIViewController
    {
        if let rootVC = UIApplication.shared.delegate?.window??.rootViewController {
            return self.yzt_currentViewController(from: rootVC)
        } else {
            return UIViewController()
        }
    }
    
    open class func yzt_currentViewController(from fromVC:UIViewController) -> UIViewController
    {
        if fromVC.isKind(of: UINavigationController.self) {
            let navigationController = fromVC as! UINavigationController
            return yzt_currentViewController(from: navigationController.viewControllers.last!)
        }
        else if fromVC.isKind(of: UITabBarController.self) {
            let tabBarController = fromVC as! UITabBarController
            return yzt_currentViewController(from: tabBarController.selectedViewController!)
        }
        else if fromVC.presentedViewController != nil {
            return yzt_currentViewController(from:fromVC.presentingViewController!)
        }
        else {
            return fromVC
        }
    }
}
