//
//  MovieCollectionViewCell.swift
//  Moviedb
//
//  Created by Samir on 6/22/22.
//

import UIKit
import Kingfisher

class MovieCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak private var posterImageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bind(with viewModel: MovieViewModel) {
        titleLabel.text = viewModel.title
        dateLabel.text = viewModel.releaseDate
        setPoster(with: viewModel.imageUrl)
    }
    
    private func setPoster(with urlString: String?) {
        guard let urlString = urlString, let url = URL(string: urlString) else { return }
        posterImageView.kf.setImage(with: url)
    }
}
