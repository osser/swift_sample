//
//  EditTodoViewController.swift
//  Todolist
//
//  Created by xiaoma on 2015/12/12.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit
import Cartography
import FontAwesomeKit

class EditTodoViewController: UIViewController {
    
    private let descriptionTextField = UITextField();
    private let descriptionSeparator = UIView();
    private let listNameLabel = UILabel();
    private let listButton = UIButton();
    private let listSeparator = UIView();
    private let dueDateLabel = UILabel();
    private let dueDateButton = UIButton();
    private let dueDateSeparator = UIView();
    private let doneButton = UIButton();
    private let dueDatePicker = UIDatePicker();
    
    private let todosDatastore: TodosDatastore;
    private let todoToEdit: Todo?;
    private var list: List;
    private var dueDate: NSDate;
    
    init(todosDatastore:TodosDatastore, todoToEdit: Todo?){
        self.todosDatastore = todosDatastore;
        self.todoToEdit = todoToEdit;
        if let todo = self.todoToEdit {
            descriptionTextField.text = todo.description;
            list = todo.list;
            dueDate = todo.dueDate;
        }else{
            list = self.todosDatastore.defaultList();
            dueDate = self.todosDatastore.defaultDueDate();
        }
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

// MARK:イベント
extension EditTodoViewController {
    func listButtonPressed(sender: UIButton){
        let listsVC = ListsViewController(todosDatastore: todosDatastore, onListSelected: { list in
            self.list = list;
            self.refresh();
        });
        navigationController?.pushViewController(listsVC, animated: true);
    }
    func dueDateButtonPressed(sender: UIButton){
        descriptionTextField.resignFirstResponder();
    }
    func doneButtonPressed(sender: UIButton){
        if !descriptionTextField.text!.isEmpty {
            let newTodo = Todo(
                description:descriptionTextField.text!,
                list: list,
                dueDate: dueDate,
                done: false,
                doneDate: nil
            );
            todosDatastore.addTodo(newTodo);
            if let tmptodo = todoToEdit {
                todosDatastore.deleteTodo(tmptodo);
            }
            navigationController?.popViewControllerAnimated(true);
        }
    }
    func dueDateChanged(sender: UIButton){
        dueDate = dueDatePicker.date;
        refresh();
    }
}

// MARK:初期化
private extension EditTodoViewController {
    func setup(){
        func descriptionSetup(){
            descriptionTextField.placeholder = "Description of Todo";
            descriptionTextField.becomeFirstResponder();
            view.addSubview(descriptionTextField);
            view.addSubview(descriptionSeparator);
        }
        func listSetup(){
            view.addSubview(listNameLabel);
            listButton.setAttributedTitle(FAKFontAwesome.listIconWithSize(20).attributedString(), forState: .Normal);
            listButton.addTarget(self, action: "listButtonPressed:", forControlEvents: .TouchUpInside);
            view.addSubview(listButton);
            view.addSubview(listSeparator);
        }
        func dueDateSetup(){
            view.addSubview(dueDateLabel);
            dueDateButton.setAttributedTitle(FAKFontAwesome.clockOIconWithSize(20).attributedString(), forState: .Normal);
            dueDateButton.addTarget(self, action: "dueDateButtonPressed:", forControlEvents: .TouchUpInside);
            view.addSubview(dueDateButton);
            view.addSubview(dueDateSeparator);
        }
        func doneSetup(){
            doneButton.setAttributedTitle(FAKFontAwesome.checkIconWithSize(80).attributedString(), forState: .Normal);
            doneButton.addTarget(self, action: "doneButtonPressed:", forControlEvents: .TouchUpInside);
            view.addSubview(doneButton);
        }
        func datePickerSetup(){
            dueDatePicker.datePickerMode = .DateAndTime;
            dueDatePicker.minimumDate = NSDate();
            dueDatePicker.date = dueDate;
            dueDatePicker.addTarget(self, action: "dueDateChanged:", forControlEvents: .ValueChanged);
            view.addSubview(dueDatePicker);
        }
        
        descriptionSetup();
        listSetup();
        dueDateSetup();
        doneSetup();
        datePickerSetup();
        refresh();
    }
    func layoutView(){
        func descriptionLayout(){
            constrain(descriptionTextField, block: { thisView in
                thisView.top == thisView.superview!.top + 70;
                thisView.left == thisView.superview!.left + 10;
                thisView.right == thisView.superview!.right - 10;
                thisView.height == 50;
            });
            constrain(descriptionSeparator, descriptionTextField, block: { thisView, thisView2 in
                thisView.left == thisView.superview!.left;
                thisView.right == thisView.superview!.right;
                thisView.top == thisView2.bottom;
                thisView.height == 1;
            });
        }
        func listLayout(){
            constrain(listNameLabel, descriptionSeparator, block: { lview, lview2 in
                lview.top == lview2.bottom;
            });
            constrain(listNameLabel, descriptionTextField, block: { lview, lview2 in
                lview.left == lview2.left;
                lview.height == lview2.height;
            });
            constrain(listNameLabel, listButton, block: { lview, lview2 in
                lview.right == lview2.left;
                lview.top == lview2.top;
                lview.height == lview2.height;
                lview2.height == lview2.width;
                lview2.right == lview2.superview!.right;
            });
            constrain(listSeparator, listNameLabel, block: { lview, lview2 in
                lview.left == lview.superview!.left;
                lview.right == lview.superview!.right;
                lview.top == lview2.bottom;
                lview.height == 1;
            });
        }
        func dueDateLayout(){
            constrain(dueDateLabel, listSeparator, block: { lview, lview2 in
                lview.top == lview2.bottom;
            });
            constrain(dueDateLabel, listNameLabel, block: { lview, lview2 in
                lview.left == lview2.left;
                lview.height == lview2.height;
            });
            constrain(dueDateLabel, dueDateButton, block: { lview, lview2 in
                lview.right == lview2.left;
                lview.top == lview2.top;
                lview.height == lview2.height;
                lview2.height == lview2.width;
                lview2.right == lview2.superview!.right;
            });
            constrain(dueDateSeparator, dueDateLabel, block: { lview, lview2 in
                lview.left == lview.superview!.left;
                lview.right == lview.superview!.right;
                lview.top == lview2.bottom;
                lview.height == 1;
            });
        }
        func doneLayout(){
            constrain(doneButton, dueDateSeparator, block: { lview, lview2 in
                lview.top == lview2.bottom + 20;
                lview.centerX == lview.superview!.centerX;
                lview.height == lview.width;
                lview.width == 100;
            });
        }
        func datePickerLayout(){
            constrain(dueDatePicker, block: { lview in
                lview.left == lview.superview!.left;
                lview.right == lview.superview!.right;
                lview.bottom == lview.superview!.bottom;
            });
        }
        
        descriptionLayout();
        listLayout();
        dueDateLayout();
        doneLayout();
        datePickerLayout();
    }
    func style(){
        view.backgroundColor = UIColor.whiteColor();
        
        descriptionTextField.font = UIFont.latoLightFontOfSize(20);
        descriptionTextField.backgroundColor = UIColor.whiteColor();
        descriptionSeparator.backgroundColor = UIColor.separatorColor();
        
        listNameLabel.font = UIFont.latoFontOfSize(16);
        listNameLabel.backgroundColor = UIColor.whiteColor();
        listSeparator.backgroundColor = UIColor.separatorColor();
        
        dueDateLabel.font = UIFont.latoFontOfSize(16);
        dueDateLabel.backgroundColor = UIColor.whiteColor();
        dueDateSeparator.backgroundColor = UIColor.separatorColor();
    }
    func refresh(){
        listNameLabel.text = "List: \(list.description)";
        
        let dateFormatter: NSDateFormatter = NSDateFormatter();
        dateFormatter.dateFormat = "HH:mm dd-MM-YYYY";
        let formattedDueDate = dateFormatter.stringFromDate(dueDate);
        dueDateLabel.text = "Due date: \(formattedDueDate)";
    }
}