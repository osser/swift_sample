//
//  TodosViewController.swift
//  Todolist
//
//  Created by xiaoma on 2015/12/10.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit
import Cartography
import LatoFont

class TodosViewController: UIViewController {
    
    private let tableView = UITableView();
    private let addButton = UIButton();
    
    private let todosDatastore: TodosDatastore;
    private var todos: [Todo];
    
    private init() {
        fatalError("未実装");
    }
    
    required init(todosDatastore: TodosDatastore) {
        self.todosDatastore = todosDatastore;
        self.todos = todosDatastore.todos();
        super.init(nibName: nil, bundle: nil);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("未実装");
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup();
        layoutView();
        style();
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        refresh();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK:初期化
extension TodosViewController {
    func setup() {
        title = "Todos";
        view.backgroundColor = UIColor.clouds();
        tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell");
        //tableView.registerClass(TodoViewCell.classForCoder(), forHeaderFooterViewReuseIdentifier: "Cell");
        tableView.dataSource = self;
        tableView.rowHeight = 80;
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0);
        view.addSubview(tableView);
        
        addButton.addTarget(self, action: "addTodoButtonPressed:", forControlEvents: .TouchUpInside);
        view.addSubview(addButton);
    }
    func layoutView(){
        constrain(tableView) { view in
            view.top == view.superview!.top;
            view.bottom == view.superview!.bottom;
            view.left == view.superview!.left;
            view.right == view.superview!.right;
        }

        constrain(addButton, block: { view in
            view.bottom == view.superview!.bottom - 5;
            view.centerX == view.superview!.centerX;
            view.width == view.height;
            view.height == 60;
            
        });
        
//        constrain(addButton) { view in
//            view.bottom == view.superview!.bottom - 5;
//            view.centerX == view.superview!.centerX;
//            view.width == view.height;
//            view.height == 60;
//        }
    }
    func style() {
        view.backgroundColor = UIColor.whiteColor();
        addButton.setImage(UIImage(named: "add-button"), forState: .Normal);
    }
    private func refresh(){
        todos = todosDatastore.todos().sort { a,b in
            return a.dueDate.compare(b.dueDate) == NSComparisonResult.OrderedAscending;
        };
        tableView.reloadData();
    }
}

// MARK:UITableViewDataSource
extension TodosViewController : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todos.count;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell;
        cell.selectionStyle = .Blue;
        cell.textLabel?.font = UIFont.latoLightFontOfSize(14);
        cell.textLabel?.text = "Todo number \(indexPath.row)";
        
//        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! TodoViewCell;
//        let todo = todos[indexPath.row];
//        cell.render(todo);
//        cell.selectionStyle = .Blue;
        
        return cell;
    }
}

// MARK:イベント
extension TodosViewController {
    func addTodoButtonPressed(sender:UIButton) {
        print("addTodoButtonPressed");
    }
}