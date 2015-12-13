//
//  ListViewCell.swift
//  Todolist
//
//  Created by xiaoma on 2015/12/13.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit
import Cartography
import LatoFont

class ListViewCell: UITableViewCell {
    
    private let title = UILabel();

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews();
        
        setup();
        layoutView();
        style();
    }

}

extension ListViewCell {
    func setup(){
        title.numberOfLines = 0;
        contentView.addSubview(title);
    }
    func layoutView(){
        constrain(title, block: {lview in
            lview.top == lview.superview!.top + 5;
            lview.bottom == lview.superview!.bottom - 5;
            lview.left == lview.superview!.left + 15;
            lview.right == lview.superview!.right - 10;
        });
    }
    func style(){
        contentView.backgroundColor = UIColor.clearColor();
        title.textAlignment = .Left;
        title.font = UIFont.latoLightFontOfSize(18);
    }
    func render(list: List){
        title.text = list.description;
    }
}