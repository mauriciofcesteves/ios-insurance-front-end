//
//  ViewController.swift
//  Seguros
//
//  Created by Mauricio Esteves on 2018-03-18.
//  Copyright © 2018 Mauricio Esteves. All rights reserved.
//

import UIKit

class CustomerListViewController: UIViewController {

    /** Properties */
    public static var displayWidth: CGFloat = 130.0
    public static var padding: CGFloat = 20.0
    
    /** The image view. */
    public let logoImageView: UIImageView = {
        
        let imageView                                       = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image                                     = UIImage(named: "EstevesCorretoraLogo")
        imageView.contentMode                               = .scaleAspectFit
        
        return imageView
    }()
    
    // MARK: - Init
    public init() {
        super.init(nibName: nil, bundle: nil)
        
        view.backgroundColor = UIColor.white
        view.addSubview(logoImageView)
        addConstraints()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func navigation(_ customerListViewController: UIViewController) -> UINavigationController {
        
        let controller                    = UINavigationController(rootViewController: customerListViewController)
        controller.navigationBar.isHidden = true
        return controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate func addConstraints() {
        
        guard let imageSize = logoImageView.image?.size else {
            return
        }
        
        let aspectRatio = imageSize.width/imageSize.height
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: CustomerListViewController.padding),
            logoImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            logoImageView.widthAnchor.constraint(equalToConstant: CustomerListViewController.displayWidth),
            logoImageView.heightAnchor.constraint(equalToConstant: CustomerListViewController.displayWidth/aspectRatio),
        ])
    }
}

