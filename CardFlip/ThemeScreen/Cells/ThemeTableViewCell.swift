//
//  ShopTableViewCell.swift
//  CardFlip
//
//  Created by Ilya on 26.04.22.
//

import UIKit

class ThemeTableViewCell: UITableViewCell {

    @IBOutlet weak var view: UIView!
    @IBOutlet weak var themeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if isSelected {
            self.view.backgroundColor = UIColor(red:   30.0 / 255,
                                                green: 85.0 / 255,
                                                blue:  28.0 / 255,
                                                alpha: 1.0)
            self.themeLabel.textColor = .white
        }
        else {
            self.view.backgroundColor = .white
            self.themeLabel.textColor = .black
        }
    }
}

extension ThemeTableViewCell {
    func configure() {
        self.view.layer.shadowColor = UIColor.black.cgColor
        self.view.layer.shadowRadius = 5
        self.view.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.view.layer.shadowOpacity = 0.3
        self.view.layer.cornerRadius = self.view.frame.height / 4
    }
}
