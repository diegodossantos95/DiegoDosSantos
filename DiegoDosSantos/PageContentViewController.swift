//
//  PageContentViewController.swift
//  DiegoDosSantos
//
//  Created by Diego dos Santos on 4/25/15.
//  Copyright (c) 2015 Diego dos Santos. All rights reserved.
//

import UIKit

class PageContentViewController: UIViewController {

    @IBOutlet weak var image: UIImageView!
    var pageIndex : Int?
    var uiimage : UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.image.image = uiimage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
