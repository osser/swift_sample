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
import MGSwipeTableCell

class TodosViewController: UIViewController {
    
    private let tableView = UITableView();
    private let addButton = UIButton();
    
    let todosDatastore: TodosDatastore;
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

        view.backgroundColor = UIColor.whiteColor();

        //tableView.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "Cell");
        tableView.registerClass(TodoViewCell.classForCoder(), forCellReuseIdentifier: "Cell");
        tableView.dataSource = self;
        tableView.rowHeight = 100;
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 100, right: 0);
        view.addSubview(tableView);
        
        addButton.setImage(UIImage(named: "add-button"), forState: .Normal);
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
    }
    func style() {
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
//        let cell = tableView.dequeueReusableCellWithIdentifier("Cell")! as UITableViewCell;
//        cell.selectionStyle = .Blue;
//        cell.textLabel?.font = UIFont.latoLightFontOfSize(14);
//        cell.textLabel?.text = "Todo number \(indexPath.row)";
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! TodoViewCell;
        let todo = todos[indexPath.row];
        cell.delegate = self;
        cell.render(todo);
        //cell.selectionStyle = .Blue;
        
        return cell;
    }
}

// MARK:イベント
extension TodosViewController {
    func addTodoButtonPressed(sender:UIButton) {
        //print("addTodoButtonPressed");
        let addTodoVC = EditTodoViewController(todosDatastore: todosDatastore, todoToEdit: nil);
        addTodoVC.title = "New Todo";
        navigationController?.pushViewController(addTodoVC, animated: true);
    }
    func editButtonPressed(todo: Todo){
        let editTotoVC = EditTodoViewController(todosDatastore: todosDatastore, todoToEdit: todo);
        editTotoVC.title = "Edit Todo";
        navigationController?.pushViewController(editTotoVC, animated: true);
        
    }
}

// MARK:MGSwipeTableCellDelegate
extension TodosViewController: MGSwipeTableCellDelegate {
    func swipeTableCell(cell: MGSwipeTableCell!, canSwipe direction: MGSwipeDirection) -> Bool {
        //print("swipeTableCell.canSwipe");
        return true;
    }
    func swipeTableCell(cell: MGSwipeTableCell!, didChangeSwipeState state: MGSwipeState, gestureIsActive: Bool) {
        //print("swipeTableCell.didChangeSwipeState");
    }
    func swipeTableCell(cell: MGSwipeTableCell!, swipeButtonsForDirection direction: MGSwipeDirection, swipeSettings: MGSwipeSettings!, expansionSettings: MGSwipeExpansionSettings!) -> [AnyObject]! {
        //print("swipeTableCell.swipeButtonsForDirection");
        return nil;
    }
    func swipeTableCell(cell: MGSwipeTableCell!, tappedButtonAtIndex index: Int, direction: MGSwipeDirection, fromExpansion: Bool) -> Bool {
        if let mycell = cell as? TodoViewCell {
            //print(mycell.todo);
            switch direction {
            case .LeftToRight:
                switch index {
                case 0:
                    //print("Done");
                    todosDatastore.doneTodo(mycell.todo);
                    refresh();
                default:
                    break;
                }
                break;
            case .RightToLeft:
                switch index {
                case 0:
                    //print("Edit");
                    editButtonPressed(mycell.todo);
                    break;
                case 1:
                    //print("Delete");
                    todosDatastore.deleteTodo(mycell.todo);
                    refresh();
                default:
                    break;
                }
                break;
            }
        }
        return true;
    }
}