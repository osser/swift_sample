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
    
    private var selectedIndexes = Array<NSIndexPath>();
    private var numberOfPairs = 0;
    private var score = 0;
    
    //private var deck:[Int] = [];
    private var deck: Deck!;
    
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
        //deck = Array<Int>(count: numCardsNeededDifficulty(difficulty), repeatedValue: 1);
        deck = createDeck(numCardsNeededDifficulty(difficulty));
        for i in 0..<deck.count {
            print("The card at index [\(i)] is [\(deck[i].description)]");
        }
        collectionView.reloadData();
    }
    
    private func createDeck(numCards: Int) -> Deck {
        let fullDeck = Deck.full().shuffled();
        let halfDeck = fullDeck.deckOfNumberOfCards(numCards / 2);
        return (fullDeck + halfDeck).shuffled();
    }
}

//MARK:Setup
extension MemoryViewController: UICollectionViewDataSource {
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("deck.count:\(deck.count)");
        return deck.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cardCell", forIndexPath: indexPath) as! CardCell;
        let card = deck[indexPath.row];
        //cell.backgroundColor = UIColor.sunflower();
        cell.renderCardName(card.description, backImageName: "back");
        return cell;
    }
}

extension MemoryViewController: UICollectionViewDelegate {
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        if selectedIndexes.count == 2 || selectedIndexes.contains(indexPath) {
            return;
        }
        selectedIndexes.append(indexPath);
        
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! CardCell;
        cell.upturn();
        
        if selectedIndexes.count < 2 {
            return;
        }
        
        let card1 = deck[selectedIndexes[0].row];
        let card2 = deck[selectedIndexes[1].row];
        
        if card1 == card2 {
            numberOfPairs++;
            checkIfFinished();
            removeCards();
        }else{
            score++;
            turnCardsFaceDown();
        }
        
//        execAfter(2, block: {
//            cell.downturn();
//        });
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
        //collectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "cardCell");
        collectionView.registerClass(CardCell.self, forCellWithReuseIdentifier: "cardCell");
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
    
    func checkIfFinished() {
        if numberOfPairs == deck.count / 2 {
            showFinalPopUp();
        }
    }
    
    func showFinalPopUp(){
        let alert = UIAlertController(title: "Great!", message: "You won with score: \(score)!", preferredStyle: .Alert);
        alert.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { action in
            self.dismissViewControllerAnimated(true, completion: nil);
            return;
        }));
        
        self.presentViewController(alert, animated: true, completion: nil);
    }
    
    func removeCards() {
        execAfter(1.0, block: {
            self.removeCardsAtPlaces(self.selectedIndexes);
            self.selectedIndexes = Array<NSIndexPath>();
        });
    }
    
    func removeCardsAtPlaces(places: Array<NSIndexPath>) {
        for index in selectedIndexes {
            let cardCell = collectionView.cellForItemAtIndexPath(index) as! CardCell;
            cardCell.remove();
        }
    }
    
    func turnCardsFaceDown() {
        execAfter(2.0, block: {
            self.downturnCardsAtPlaces(self.selectedIndexes);
            self.selectedIndexes = Array<NSIndexPath>();
        });
    }
    
    func downturnCardsAtPlaces(places: Array<NSIndexPath>) {
        for index in selectedIndexes {
            let cardCell = collectionView.cellForItemAtIndexPath(index) as! CardCell;
            cardCell.downturn();
        }
    }
    
}