//
//  ShopCell.swift
//  CardFlip
//
//  Created by Ilya on 16.04.22.
//

import UIKit

class ShopCell: UITableViewCell {

    @IBOutlet weak var themeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 10
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: true)

        // Configure the view for the selected state
    }

}
