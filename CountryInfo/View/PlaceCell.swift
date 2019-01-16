//
//  PlaceCell.swift
//  CountryInfo
//
//  Created by Mohit CCT on 16/01/19.
//  Copyright © 2019 Mohit. All rights reserved.
//

import Foundation

class PlaceCell: UITableViewCell {
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func SetUpCellData(placeInfo: CountryPlace) {
        
        if placeInfo.placeTitle.count == 0 {
            titleLabel.text = "--"
        }
        else {
            titleLabel.text = placeInfo.placeTitle
        }
        if placeInfo.placeDetails.count == 0 {
            detailLabel.text = "--"
        }
        else {
            detailLabel.text = placeInfo.placeDetails
        }
        if placeInfo.placeImageStr.count == 0 {
            
        }
        else {
            
            picImageView.sd_setShowActivityIndicatorView(true)
            picImageView.sd_setIndicatorStyle(.gray)
            picImageView.sd_setImage(with: URL.init(string: placeInfo.placeImageStr), placeholderImage: nil, options: SDWebImageOptions(rawValue: 0))
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        //…
        label.translatesAutoresizingMaskIntoConstraints = false //Must use
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()
    
    let picImageView: UIImageView = {
        let imageView = UIImageView()
        //…
        imageView.translatesAutoresizingMaskIntoConstraints = false //Must use
        
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let detailLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.numberOfLines = 0
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        //…
        label.translatesAutoresizingMaskIntoConstraints = false //Must use
        label.font = UIFont.systemFont(ofSize: 16)
        return label
    }()
    
    //MARK: init
    //Add Subviews and then layout Contraints to the Cell’s contentView
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViewsAndlayout()
    }
    
    
    /// Add and sets up subviews with programmically added constraints
    func addSubViewsAndlayout() {
        contentView.addSubview(titleLabel) //will crash if not added
        contentView.addSubview(detailLabel) //will crash if not added
        contentView.addSubview(picImageView) //will crash if not added
        
        
        let imageLeadingConstraint = NSLayoutConstraint(item: picImageView,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   relatedBy: NSLayoutConstraint.Relation.equal,
                                                   toItem: self.contentView,
                                                   attribute: NSLayoutConstraint.Attribute.leading,
                                                   multiplier: 1,
                                                   constant: 8)
        
        let imageTopConstraint = NSLayoutConstraint(item: picImageView,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               relatedBy: NSLayoutConstraint.Relation.equal,
                                               toItem: self.contentView,
                                               attribute: NSLayoutConstraint.Attribute.top,
                                               multiplier: 1,
                                               constant: 8)
        
        let imageBottomConstraint = NSLayoutConstraint(item: self.contentView,
                                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                                  relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual,
                                                  toItem: picImageView,
                                                  attribute: NSLayoutConstraint.Attribute.bottom,
                                                  multiplier: 1,
                                                  constant: 8)
        
        let imageWidthConstraint = NSLayoutConstraint(item: picImageView,
                                                 attribute: NSLayoutConstraint.Attribute.width,
                                                 relatedBy: NSLayoutConstraint.Relation.equal,
                                                 toItem: nil,
                                                 attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                 multiplier: 1,
                                                 constant: 80)
        let imageHeightConstraint = NSLayoutConstraint(item: picImageView,
                                                  attribute: NSLayoutConstraint.Attribute.height,
                                                  relatedBy: NSLayoutConstraint.Relation.equal,
                                                  toItem: nil,
                                                  attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                  multiplier: 1,
                                                  constant: 80)
        
        self.contentView.addConstraints([imageLeadingConstraint, imageTopConstraint, imageWidthConstraint, imageHeightConstraint, imageBottomConstraint])
        
        let titleTopConstraint = NSLayoutConstraint(item: titleLabel,
                                                attribute: NSLayoutConstraint.Attribute.top,
                                                relatedBy: NSLayoutConstraint.Relation.equal,
                                                toItem: self.contentView,
                                                attribute: NSLayoutConstraint.Attribute.top,
                                                multiplier: 1,
                                                constant: 10)
     
        let titleHeightConstraint = NSLayoutConstraint(item: titleLabel,
                                                       attribute: NSLayoutConstraint.Attribute.height,
                                                       relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual,
                                                       toItem: nil,
                                                       attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                       multiplier: 1,
                                                       constant: 21)
        
        let titleTrailingConstraint = NSLayoutConstraint(item: titleLabel,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: self.contentView,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    multiplier: 1,
                                                    constant: -8)
        
        let titleLeadingConstraint = NSLayoutConstraint(item: titleLabel,
                                                    attribute: NSLayoutConstraint.Attribute.leading,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: picImageView,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    multiplier: 1,
                                                    constant: 8)
        
        self.contentView.addConstraints([titleTopConstraint, titleHeightConstraint, titleTrailingConstraint, titleLeadingConstraint])
        
        let detailLabelLeadingConstraint = NSLayoutConstraint(item: detailLabel,
                                                    attribute: NSLayoutConstraint.Attribute.leading,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: picImageView,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    multiplier: 1,
                                                    constant: 8)
        
        let detailLabelTrailingConstraint = NSLayoutConstraint(item: detailLabel,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    relatedBy: NSLayoutConstraint.Relation.equal,
                                                    toItem: self.contentView,
                                                    attribute: NSLayoutConstraint.Attribute.trailing,
                                                    multiplier: 1,
                                                    constant: -8)
        
        let detailLabelbottomConstraint = NSLayoutConstraint(item: detailLabel,
                                                             attribute: NSLayoutConstraint.Attribute.bottom,
                                                             relatedBy: NSLayoutConstraint.Relation.lessThanOrEqual,
                                                             toItem: self.contentView,
                                                             attribute: NSLayoutConstraint.Attribute.bottom,
                                                             multiplier: 1,
                                                             constant: -10)
        
        let detailLabeltopConstraint = NSLayoutConstraint(item: detailLabel,
                                                          attribute: NSLayoutConstraint.Attribute.top,
                                                          relatedBy: NSLayoutConstraint.Relation.equal,
                                                          toItem: titleLabel,
                                                          attribute: NSLayoutConstraint.Attribute.bottom,
                                                          multiplier: 1,
                                                          constant: 8)
        
        let detailLabelheightConstraint = NSLayoutConstraint(item: detailLabel,
                                                             attribute: NSLayoutConstraint.Attribute.height,
                                                             relatedBy: NSLayoutConstraint.Relation.greaterThanOrEqual,
                                                             toItem: nil,
                                                             attribute: NSLayoutConstraint.Attribute.notAnAttribute,
                                                             multiplier: 1,
                                                             constant: 21)
        
        self.contentView.addConstraints([detailLabelLeadingConstraint, detailLabelTrailingConstraint, detailLabelbottomConstraint, detailLabeltopConstraint, detailLabelheightConstraint])
    }
}
