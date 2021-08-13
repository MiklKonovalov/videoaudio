//
//  VideoTableViewCell.swift
//  AVFoundation_Audio
//
//  Created by Misha on 13.08.2021.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    static let identifier = "VideoTableViewCell"
    
    private let nameVideoLabel: UILabel = {
        let nameVideoLabel = UILabel()
        nameVideoLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        nameVideoLabel.text = "Video"
        nameVideoLabel.textColor = .gray
        nameVideoLabel.textAlignment = .center
        nameVideoLabel.translatesAutoresizingMaskIntoConstraints = false
        return nameVideoLabel
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(nameVideoLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(text: String) {
        nameVideoLabel.text = text
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameVideoLabel.text = nil
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        nameVideoLabel.frame = CGRect(x: 5,
                                      y: 5,
                                      width: 50,
                                      height: contentView.frame.size.height-10)
    }
    
}
