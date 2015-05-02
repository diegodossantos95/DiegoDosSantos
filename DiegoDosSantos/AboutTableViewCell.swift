//
//  AboutTableViewCell.swift
//  DiegoDosSantos
//
//  Created by Diego dos Santos on 4/23/15.
//  Copyright (c) 2015 Diego dos Santos. All rights reserved.
//

import UIKit

class AboutTableViewCell: UITableViewCell {

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var detailView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
