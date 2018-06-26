//
//  ArticleTableViewCell.swift
//  TechnologyAssessmentApp
//
//  Created by Kshitij Godara on 26/06/18.
//  Copyright © 2018 Nagarro. All rights reserved.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {

    
    //
    // MARK: - IBOutlets
    //
    @IBOutlet weak var articleIconImageView: UIImageView!
    @IBOutlet weak var articleAbstractLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var byLineLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    
        self.articleAbstractLabel.accessibilityIdentifier = "Label--articleLabel"
        
        //Article imageview round setUp
        articleIconImageView.clipsToBounds = true
        articleIconImageView.layer.cornerRadius = ((60 * UIScreen.main.bounds.width)/375.0)/2.0
        articleIconImageView.layer.masksToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
