//
//  HomeController.swift
//  CarAppProgrammatic
//
//  Created by Mac on 21.01.25.
//

import UIKit

class HomeController: UIViewController {
    private let image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "loginLogo")
        image.backgroundColor = UIColor.black
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configUI()
    }
    
    func configUI() {
        view.backgroundColor = .red
        view.addSubview(image)
    }
}
