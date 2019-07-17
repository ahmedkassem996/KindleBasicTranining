//
//  BookPageController.swift
//  KindleLBTA
//
//  Created by AHMED on 4/25/1398 AP.
//  Copyright © 1398 AHMED. All rights reserved.
//

import UIKit

class BookPageController: UICollectionViewController, UICollectionViewDelegateFlowLayout{
  
  var book: Book?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    collectionView.backgroundColor = UIColor.white
    navigationItem.title = self.book?.title
    
    collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
    
    let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
    layout?.scrollDirection = .horizontal
    layout?.minimumLineSpacing = 0
    
    collectionView?.isPrefetchingEnabled = true
    
    self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Close", style: .plain, target: self, action: #selector(handlecloseBook))
  }
  
  @objc func handlecloseBook(){
    dismiss(animated: true, completion: nil)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: view.frame.height - 44 - 20)
  }
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return book?.pages.count ?? 0
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let pageCell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! PageCell
    
    let page = book?.pages[indexPath.row]
    pageCell.textLabel.text = page?.text
    
//    if indexPath.item % 2 == 0{
//      cell.backgroundColor = .red
//    }else{
//      cell.backgroundColor = .blue
//    }
    return pageCell
  }
}
