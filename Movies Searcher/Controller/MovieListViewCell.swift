//
//  MovieListViewCell.swift
//  Movies Searcher
//
//  Created by Adwait Barkale on 07/09/20.
//  Copyright © 2020 Adwait Barkale. All rights reserved.
//

import UIKit

class MovieListViewCell: UITableViewCell {

    @IBOutlet weak var imgPoster: UIImageView!
    @IBOutlet weak var lblMovieName: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblType: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
