//
//  MemoryViewController.swift
//  MemoryGame
//
//  Created by xiaoma on 2015/12/07.
//  Copyright © 2015年 xiaoma. All rights reserved.
//

import UIKit

class MemoryViewController: UIViewController {
    
    private var collectionView: UICollectionView!;
    private var deck:[Int] = [];
    
    private let difficulty: Difficulty;
    
    init(difficulty: Difficulty){
        self.difficulty = difficulty;
        super.init(nibName: nil, bundle:nil);
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented.");
    }
    
    deinit {
        print("deinit");
    }
    
    override func viewDidLoad() {
        super.viewDidLoad();
        setup();
        start();
    }
    
    private func start(){
        deck = Array<Int>(count: numCardsNeededDifficulty(difficulty), repeatedValue: 1);
        collectionView.reloadData();
    }
}

//MARK:Setup
extension MemoryViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("deck.count:\(deck.count)");
        return deck.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cardCell", forIndexPath: indexPath); // as! UICollectionViewCell;
        cell.backgroundColor = UIColor.sunflower();
        return cell;
    }
}

extension MemoryViewController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //<#code#>
    }
}

private extension MemoryViewController {
    func setup(){
        view.backgroundColor = UIColor.greenSea();
        
        let space:CGFloat = 5;
        let (covWidth, covHeight) = collectionViewSizeDifficulty(difficulty, space: space);
        let (cardWidth, cardHeight) = cardSizeDifficulty(difficulty, space: space);
        let layout = layoutCardSize((cardWidth, cardHeight), space: space);
        
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: covWidth, height: covHeight), collectionViewLayout: layout);
        collectionView.center = view.center;
        collectionView.dataSource = self;
        collectionView.delegate = self;
        collectionView.scrollEnabled = false;
        collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cardCell");
        collectionView.backgroundColor = UIColor.clearColor();
        
        self.view.addSubview(collectionView);
        
        NSLog("view.frame.width:" + String(view.frame.width));
        NSLog("view.frame.height:" + String(view.frame.height));
        NSLog("covWidth:" + String(covWidth));
        NSLog("covHeight:" + String(covHeight));
        NSLog("cardWidth:" + String(cardWidth));
        NSLog("cardHeight:" + String(cardHeight));
    }
    
    func collectionViewSizeDifficulty(difficulty: Difficulty, space: CGFloat) -> (CGFloat, CGFloat) {
        let (columns, rows) = sizeDifficulty(difficulty);
        let (cardWidth, cardHeight) = cardSizeDifficulty(difficulty, space: space);
        let covWidth = columns * (cardWidth + 2*space);
        let covHeight = rows * (cardHeight + space);
        return (covWidth, covHeight);
    }
    
    func cardSizeDifficulty(difficulty: Difficulty, space: CGFloat) -> (CGFloat, CGFloat) {
        let ratio: CGFloat = 1.452;
        let (_, rows) = sizeDifficulty(difficulty);
        let cardHeight: CGFloat = view.frame.height / rows - 2*space;
        let cardWidth: CGFloat = cardHeight / ratio;
        return (cardWidth, cardHeight);
    }
    
    func sizeDifficulty(difficulty: Difficulty) -> (CGFloat, CGFloat) {
        switch difficulty {
        case .Easy:
            return (4,3);
        case .Medium:
            return (6,4);
        case .Hard:
            return (8,4);
        }
    }
    
    func numCardsNeededDifficulty(difficulty: Difficulty) -> Int {
        let (columns, rows) = sizeDifficulty(difficulty);
        return Int(columns * rows);
    }
    
    func layoutCardSize(cardSize:(cardWidth: CGFloat, cardHeight: CGFloat), space: CGFloat) -> UICollectionViewLayout {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout();
        layout.sectionInset = UIEdgeInsets(top: space, left: space, bottom: space, right: space);
        layout.itemSize = CGSize(width: cardSize.cardWidth, height: cardSize.cardHeight);
        layout.minimumLineSpacing = space;
        return layout;
    }
    
}