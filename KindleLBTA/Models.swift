//
//  Models.swift
//  KindleLBTA
//
//  Created by AHMED on 4/24/1398 AP.
//  Copyright © 1398 AHMED. All rights reserved.
//

import UIKit
class Book{
  let title: String
  let author: String
  let pages: [Page]
  let coverImageUrl: String
 
  
  init(dictionary: [String: Any]) {
    self.title = dictionary["title"] as? String ?? ""
    self.author = dictionary["author"] as? String ?? ""
    self.coverImageUrl = dictionary["coverImageUrl"] as? String ?? ""
    
    var bookPages = [Page]()
    
    if let pagesdictionaries = dictionary["pages"] as? [[String: Any]]{
      for pageDictionary in pagesdictionaries{
        if let pageText = pageDictionary["text"] as? String{
          let page = Page(number: 1, text: pageText)
          bookPages.append(page)
        }
      }
    }
    pages = bookPages
  }
}

class Page{
  let number: Int
  let text: String
  
  init(number: Int, text: String) {
    self.number = number
    self.text = text
  }
}
