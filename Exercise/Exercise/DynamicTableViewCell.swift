//
//  DynamicTableViewCell.swift
//  Exercise
//
//  Created by 延强赵 on 16/5/5.
//
//

import UIKit

class DynamicTableViewCell: UITableViewCell {

    @IBOutlet weak var headPortrait: UIImageView!
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var introduceLabel: UILabel!
    
    @IBOutlet weak var imageButton: UIButton!
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.headPortrait.layer.cornerRadius = 40
        self.headPortrait.clipsToBounds = true
        
    }
    
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

   
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
