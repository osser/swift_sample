//
//  TodoViewCell.swift
//  Todolist
//
//  Created by xiaoma on 2015/12/10.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit
import Cartography

class TodoViewCell : UITableViewCell {
    private let subtitle = UILabel();
    private let title = UILabel();
    private let checkMark = UILabel();
    
    override func layoutSubviews() {
        super.layoutSubviews();
        setup();
        layoutView();
        style();
    }
}

// MARK:Setup
extension TodoViewCell {
    func setup(){
        contentView.addSubview(subtitle);
        title.numberOfLines = 0;
        contentView.addSubview(title);
        contentView.addSubview(checkMark);
    }
}

// MARK:Layout
extension TodoViewCell {
    func layoutView(){
        constrain(subtitle, block: { view in
            view.top == view.superview!.top + 10;
            view.left == view.superview!.left + 10;
            view.right == view.superview!.right - 10;
            view.height == 20;
        });
        constrain(checkMark, block: { view in
            view.left == view.superview!.left + 10;
            view.width == view.height;
        });
        constrain(title, subtitle, block: { view1, view2 in
            view1.top == view2.bottom;
        });
        constrain(title, checkMark, block: { view1, view2 in
            view1.bottom == view1.superview!.bottom - 5;
            view1.left == view2.right + 5;
            view1.right == view1.superview!.right - 10;
            view1.centerY == view2.centerY;
        });
    }
}

// MARK:Style
extension TodoViewCell {
    func style(){
        contentView.backgroundColor = UIColor.clearColor();
        subtitle.textAlignment = .Left;
        subtitle.font = UIFont.latoLightFontOfSize(14);
        title.textAlignment = .Left;
        title.font = UIFont.latoFontOfSize(18);
        checkMark.textAlignment = .Center;
    }
}

// MARK:render
extension TodoViewCell {
    //?????
    func render(todo: Todo){
    }
}