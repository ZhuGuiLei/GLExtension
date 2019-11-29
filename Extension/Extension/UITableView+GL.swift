//
//  glExtension.swift
//  Eaglglision
//
//  Created by JAVIS on 2019/9/4.
//  Copyright © 2019 JAVIS. All rights reserved.
//

import UIKit

extension UITableViewCell
{
    static func gl_dequeueReusableCell(tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "\(self)", for: indexPath)
        return cell
    }
}

extension UICollectionViewCell {
    static func gl_dequeueReusableCell(collectionView: UICollectionView, indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(self)", for: indexPath)
        return cell
    }
}

extension UICollectionView {
    
    func gl_registerCell(cell: UICollectionViewCell.Type) {
        self.register(UINib.init(nibName: "\(cell)", bundle: nil), forCellWithReuseIdentifier: "\(cell)")
    }
    
    func gl_registerCell(cell: UICollectionViewCell.Type, type: String) {
        self.register(UINib.init(nibName: "\(cell)"+type, bundle: nil), forCellWithReuseIdentifier: "\(cell)")
    }
}

extension UITableView {
    
    func gl_registerCell(cell: UITableViewCell.Type) {
        self.register(UINib.init(nibName: "\(cell)", bundle: nil), forCellReuseIdentifier: "\(cell)")
    }
    
    func gl_registerCell(cell: UITableViewCell.Type, type: String) {
        self.register(UINib.init(nibName: "\(cell)"+type, bundle: nil), forCellReuseIdentifier: "\(cell)")
    }
}



