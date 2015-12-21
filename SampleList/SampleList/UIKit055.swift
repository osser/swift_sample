//
//  UIKit055.swift
//  SampleList
//
//  Created by xiaoma on 2015/12/21.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class UIKit055: UIViewController {

    var myCollectionView : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setup();
        layoutView();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK:初期化
extension UIKit055 {
    func setup(){
        self.navigationItem.rightBarButtonItem = buildGitHubSourceWebViewButton("\(self.classForCoder)");
        
        view.backgroundColor = UIColor.whiteColor();
        
        // CollectionViewのレイアウトを生成.
        let layout = UICollectionViewFlowLayout()
        
        // Cell一つ一つの大きさ.
        layout.itemSize = CGSizeMake(50, 50)
        
        // Cellのマージン.
        layout.sectionInset = UIEdgeInsetsMake(16, 16, 32, 16)
        
        // セクション毎のヘッダーサイズ.
        layout.headerReferenceSize = CGSizeMake(100,50)
        
        // CollectionViewを生成.
        myCollectionView = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        myCollectionView.backgroundColor = UIColor.clouds();
        
        // Cellに使われるクラスを登録.
        myCollectionView.registerClass(UIKit055CustomUICollectionViewCell.self, forCellWithReuseIdentifier: "MyCell")
        myCollectionView.registerClass(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Section")
        
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        self.view.addSubview(myCollectionView)
    }
    func layoutView(){
        
    }
}

// MARK:イベント
extension UIKit055: UICollectionViewDelegate, UICollectionViewDataSource {
    /*
    Sectionの数
    */
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3
    }
    
    /*
    Cellが選択された際に呼び出される
    */
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        print("Num: \(indexPath.row)")
        print("SectionNum:\(indexPath.section)")
        
    }
    
    /*
    Cellの総数を返す
    */
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        // Section毎にCellの総数を変える.
        switch(section){
        case 0:
            return 5
            
        case 1:
            return 8
            
        case 2:
            return 20
            
        default:
            print("error")
            return 0
        }
        
    }
    
    /*
    Sectionに値を設定する
    */
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader, withReuseIdentifier: "Section", forIndexPath: indexPath); // as! UICollectionReusableView
        
        headerView.backgroundColor = UIColor.whiteColor()
        
        return headerView
    }
    
    /*
    Cellに値を設定する
    */
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell : UIKit055CustomUICollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("MyCell", forIndexPath: indexPath) as! UIKit055CustomUICollectionViewCell
        
        // Section毎にCellのプロパティを変える.
        switch(indexPath.section){
        case 0:
            cell.backgroundColor = UIColor.orange()
            cell.textLabel?.text = "0"
            
        case 1:
            cell.backgroundColor = UIColor.greenSea()
            cell.textLabel?.text = "1"
            
        case 2:
            cell.backgroundColor = UIColor.midnightblue()
            cell.textLabel?.textColor = UIColor.whiteColor()
            cell.textLabel?.text = "2"
            
        default:
            print("section error")
            cell.backgroundColor = UIColor.whiteColor()
        }
        
        return cell
    }
}

// MARK:Actions
extension UIKit055 {
    
}

class UIKit055CustomUICollectionViewCell : UICollectionViewCell{
    
    var textLabel : UILabel?
    
    required init(coder aDecoder: NSCoder) {
        //super.init(coder: aDecoder)
        fatalError("");
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // UILabelを生成.
        textLabel = UILabel(frame: CGRectMake(0, 0, frame.width, frame.height))
        textLabel?.text = "nil"
        textLabel?.textAlignment = NSTextAlignment.Center
        
        // Cellに追加.
        self.contentView.addSubview(textLabel!)
    }
    
}