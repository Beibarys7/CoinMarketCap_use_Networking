//
//  AboutViewController.swift
//  Networking
//
//  Created by Бейбарыс Шагай on 12/7/20.
//  Copyright © 2020 Бейбарыс Шагай. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var AboutImageView: UIImageView!
    @IBOutlet weak var AboutImageView2: UIImageView!
    @IBOutlet weak var AboutImageView3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        AboutImageView.image = UIImage(named: "apple")
        AboutImageView2.image = UIImage(named: "app")
        AboutImageView3.image = UIImage(named: "appcity")
    }
}
