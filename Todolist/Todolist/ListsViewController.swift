//
//  ListsViewController.swift
//  Todolist
//
//  Created by xiaoma on 2015/12/13.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit
import Cartography
import LatoFont

class ListsViewController: UIViewController {
    
    private let tableView = UITableView();
    private let addButton = UIButton();
    
    private let todosDatastore: TodosDatastore;
    private let onListSelected: (list: List) -> Void;
    
    private init(){
        fatalError("未実装");
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("未実装");
    }
    
    required init(todosDatastore: TodosDatastore, onListSelected:(list: List) -> Void) {
        self.todosDatastore = todosDatastore;
        self.onListSelected = onListSelected;
        super.init(nibName: nil, bundle: nil);
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        setup();
        layoutView();
        style();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}


private extension ListsViewController {
    func setup(){
        title = "Lists";
        tableView.registerClass(ListViewCell.classForCoder(), forCellReuseIdentifier: "Cell");
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.rowHeight = 50;
        tableView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 100, right: 0);
        view.addSubview(tableView);
        
        addButton.addTarget(self, action: "addListButtonPressed", forControlEvents: .TouchUpInside);
        view.addSubview(addButton);
    }
    func layoutView(){
        constrain(tableView, block: { lview in
            lview.top == lview.superview!.top;
            lview.bottom == lview.superview!.bottom;
            lview.left == lview.superview!.left;
            lview.right == lview.superview!.right;
        });
        constrain(addButton, block: { lview in
            lview.bottom == lview.superview!.bottom - 5;
            lview.centerX == lview.superview!.centerX;
            lview.width == lview.height;
            lview.height == 60;
        });
    }
    func style(){
        view.backgroundColor = UIColor.whiteColor();
        addButton.setImage(UIImage(named: "add-button"), forState: .Normal);
    }
}

extension ListsViewController : UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todosDatastore.lists().count;
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell") as! ListViewCell;
        let list = todosDatastore.lists()[indexPath.row];
        cell.render(list);
        cell.selectionStyle = .None;
        return cell;
    }
}

extension ListsViewController : UITableViewDelegate {
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let list = todosDatastore.lists()[indexPath.row];
        onListSelected(list: list);
        navigationController?.popViewControllerAnimated(true);
    }
}

extension ListsViewController {
    func addListButtonPressed(sender: UIButton){
        let alert = UIAlertController(title: "Enter list name", message: "To create a new list, please enter the name of the list", preferredStyle: .Alert);
        let okAction = UIAlertAction(title: "OK", style: .Default, handler: { action in
            let textField = alert.textFields![0] as UITextField;
            self.addList(textField.text!);
        });
        let cancelAction = UIAlertAction(title: "Cancel", style: .Default, handler: nil);
        alert.addAction(okAction);
        alert.addAction(cancelAction);
        
        alert.addTextFieldWithConfigurationHandler(nil);
        
        presentViewController(alert, animated: true, completion: nil);
    }
    
    func addList(description: NSString){
        todosDatastore.addListDescription(description as String);
        tableView.reloadData();
    }
}














