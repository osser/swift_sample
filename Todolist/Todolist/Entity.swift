//
//  Entity.swift
//  Todolist
//
//  Created by xiaoma on 2015/12/10.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import Foundation;

struct List {
    let description : String;
}
struct Todo: Equatable {
    let description : String;
    let list : List;
    let dueDate : NSDate;
    let done : Bool;
    let doneDate : NSDate?;
}

func ==(todo1 : Todo, todo2 : Todo) -> Bool {
    return todo1.description == todo2.description && todo1.dueDate == todo2.dueDate;
}