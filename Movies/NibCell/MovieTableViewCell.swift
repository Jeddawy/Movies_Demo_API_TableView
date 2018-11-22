//
//  MovieTableViewCell.swift
//  Movies
//
//  Created by Ibrahim El-geddawy on 6/26/18.
//  Copyright © 2018 Jiddawi. All rights reserved.
//

import UIKit
import SDWebImage
import Cosmos

class MovieTableViewCell: UITableViewCell {
    var mov : Movie!
    @IBOutlet weak var imageView_img: UIImageView!
    
    @IBOutlet weak var movieName_lbl: UILabel!
    @IBOutlet weak var rating_lbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func configureCell (movie : Movie){
        self.mov = movie
      
        self.rating_lbl.text = "rating: \(movie.rating!)"
        self.movieName_lbl.text = movie.title
        if let url = URL(string : (movie.image)!) {
            self.imageView_img.sd_setImage(with: url as? URL, placeholderImage: #imageLiteral(resourceName: "placeholder_image_logo"), completed: nil)
        }
    }
    
    
}
