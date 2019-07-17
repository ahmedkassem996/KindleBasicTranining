//
//  BookCell.swift
//  KindleLBTA
//
//  Created by AHMED on 4/25/1398 AP.
//  Copyright © 1398 AHMED. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
  
  var book: Book?{
    didSet{
      titleLabel.text = book?.title
      authorLabel.text = book?.author
      
      guard let coverImageUrl = book?.coverImageUrl else { return }
      guard let url = URL(string: coverImageUrl) else { return }
      
      coverImageView.image = nil
      
      URLSession.shared.dataTask(with: url) { (data, response, error) in
        
        if let err = error{
          print("Failed to retrive our book", err)
          return
        }
        
        guard let imageData = data else { return }
        let image = UIImage(data: imageData)
        DispatchQueue.main.async {
          self.coverImageView.image = image
        }
      }.resume()
    }
  }
  
  private let coverImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = UIImage(named: "men")
    return imageView
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "this is the text"
    label.textColor = .white
    label.font = UIFont.boldSystemFont(ofSize: 16)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let authorLabel: UILabel = {
    let label = UILabel()
    label.text = "this is the author name"
    label.textColor = .lightGray
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    backgroundColor = .clear
    
    addSubview(coverImageView)
    //coverImageView.frame = CGRect(x: 8, y: 8, width: 50, height: 64)
    coverImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
    coverImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
    coverImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
    coverImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    
    addSubview(titleLabel)
    //titleLabel.frame = CGRect(x: 66, y: 20, width: UIScreen.main.bounds.width, height: 20)
    titleLabel.leftAnchor.constraint(equalTo: coverImageView.rightAnchor, constant: 8).isActive = true
    titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
    titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
    
    addSubview(authorLabel)
    //authorLabel.frame = CGRect(x: 66, y: 48, width: 200, height: 20)
    authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
    authorLabel.leftAnchor.constraint(equalTo: coverImageView.rightAnchor, constant: 8).isActive = true
    authorLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
    authorLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
}
