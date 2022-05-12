//
//  ShopTableViewCell.swift
//  CardFlip
//
//  Created by Ilya on 26.04.22.
//

import UIKit

class ThemeTableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var selector: UIView!
    @IBOutlet weak var themeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        if isSelected {
            self.selector.backgroundColor = UIColor(red:   30.0 / 255,
                                                green: 85.0 / 255,
                                                blue:  28.0 / 255,
                                                alpha: 1.0)
        }
        else {
            self.selector.backgroundColor = .white
        }
    }
}

extension ThemeTableViewCell {
    func configure() {
        self.view.layer.cornerRadius = 10
        self.selector.layer.cornerRadius = 10
    }
}
