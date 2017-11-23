//
//  ZoomInViewController.swift
//  One-image Viewer
//
//  Created by riverciao on 2017/11/23.
//  Copyright © 2017年 riverciao. All rights reserved.
//

import UIKit

class ZoomInViewController: UIViewController, UIScrollViewDelegate {
    
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    
    lazy var buttomView: UIView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(red: 249 / 255.0, green: 223 / 255.0, blue: 23 / 255.0, alpha: 1.0)
        
        return view
    }()
    
    lazy var pickAnImageButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setTitle("Pick an Image", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .heavy)
        button.tintColor = UIColor.white
        button.backgroundColor = UIColor(red: 43/255.0, green: 43/255.0, blue: 43/255.0, alpha: 1.0)
        button.contentHorizontalAlignment = .center
        button.layer.cornerRadius = 2
        
        
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addScrollView()

    }
    
    
    func addScrollView() {
        
        imageView = UIImageView(image: UIImage(named: "img_lovelyRoadSide"))
        
        //設定滾動區域及大小
        scrollView = UIScrollView(frame: view.bounds)
        scrollView.contentSize = imageView.bounds.size
        
        view.addSubview(scrollView)
        scrollView.addSubview(imageView)
        
        //當裝置旋轉時，會重新調整大小
        scrollView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        //1.將滾動區域的位置從原點在左上角改為(1000, 450)
        //        scrollView.contentOffset = CGPoint(x: 1000, y: 450)
        
        //2. 縮放功能需要指定delegate self 跟縮放比例
        scrollView.delegate = self
        //        scrollView.minimumZoomScale = 0.1
        //        scrollView.maximumZoomScale = 4.0
        //        scrollView.zoomScale = 1.0
        
        }
        
        // 2.加了縮放功能 protocol (UIScrollViewDelegate) 需要implement 的function
        func viewForZooming(in scrollView: UIScrollView) -> UIView? {
            return imageView
        }
        
        //3. 為了讓圖片縮小填滿且有Aspect Fit
        fileprivate func updateMinZoomScaleForSize(_ size: CGSize) {
            let widthScale = size.width / imageView.bounds.width
            let heightScale = size.height / imageView.bounds.height
            
            let minScale = min(widthScale, heightScale)
            scrollView.minimumZoomScale = minScale
            
            scrollView.zoomScale = minScale
            
        }
    
    
        //4.讓圖片置中, 每次縮放之後會被呼叫
        func scrollViewDidZoom(_ scrollView: UIScrollView) {
            let imageViewSize = imageView.frame.size
            let scrollViewSize = scrollView.bounds.size
            
            let verticalPadding = imageViewSize.height < scrollViewSize.height ? (scrollViewSize.height - imageViewSize.height) / 2 : 0
            let horizontalPadding = imageViewSize.width < scrollViewSize.width ? (scrollViewSize.width - imageViewSize.width) / 2 : 0
            
            scrollView.contentInset = UIEdgeInsets(top: verticalPadding, left: horizontalPadding, bottom: verticalPadding, right: horizontalPadding)
        }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        //呼叫func讓圖片縮小填滿且有Aspect Fit
        updateMinZoomScaleForSize(view.bounds.size)
        
        view.addSubview(buttomView)
        
        NSLayoutConstraint.activate([
            buttomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0.0),
            buttomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0.0),
            buttomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0.0),
            buttomView.heightAnchor.constraint(equalToConstant: 77.0)
            ])
        
        view.addSubview(pickAnImageButton)
        
        NSLayoutConstraint.activate([
            pickAnImageButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 98.0),
            pickAnImageButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -97.0),
            pickAnImageButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16.0),
            pickAnImageButton.heightAnchor.constraint(equalToConstant: 44.0)
            ])
        
    }
}

