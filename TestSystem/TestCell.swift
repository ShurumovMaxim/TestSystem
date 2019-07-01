//
//  TestCell.swift
//  TestSystem
//
//  Created by Валерия Маслова on 16/06/2019.
//  Copyright © 2019 Shurumov Maxim. All rights reserved.
//

import UIKit

class TestCell: UITableViewCell {

    @IBOutlet weak var resultImage: UIImageView!
    @IBOutlet weak var nameTestLabel: UILabel!
    @IBOutlet weak var markLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
