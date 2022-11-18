//
//  CollectionCellCollectionViewCell.swift
//  SoundCloud
//
//  Created by Даша Волошина on 11.11.22.
//

import UIKit
import SnapKit

class CollectionViewCell: UICollectionViewCell {
    
    static let id = "CollectionViewCell"
    let label = UILabel()
    let imageView = UIImageView()
    
    
    override init(frame:CGRect){
        super.init(frame:frame)
    
        self.layer.cornerRadius = 40
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        createLayout()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func createLayout(){

        imageView.snp.makeConstraints { make in
           
            make.bottom.equalTo(contentView.snp.bottom).inset(40)
            make.width.equalTo(80)
            make.height.equalTo(80)
         
        }
        
        label.snp.makeConstraints { make in

            make.bottom.equalTo(contentView.snp.bottom).inset(5)
            make.left.equalTo(contentView.snp.left).inset(5)
//            make.width.equalTo(100)
//            make.height.equalTo(30)
        }
    }
//    
//    func configure(item:StorysItem) {
//        
//        imageView.image = UIImage(named: item.image)
//        label.text = item.title
//        
//    }
    
}
