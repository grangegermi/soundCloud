//
//  CellForUpload.swift
//  SoundCloud
//
//  Created by Даша Волошина on 17.11.22.
//

import UIKit
import SnapKit

class CellForUpload: UICollectionViewCell {
    
    let imageView = UIImageView()
    let labelFirst = UILabel()
    let labelSecond = UILabel()
    static let id = "CellForUpload"
    
    override init(frame:CGRect){
        super.init(frame:frame)
        
        
        contentView.addSubview(imageView)
        imageView.addSubview(labelFirst)
        imageView.addSubview(labelSecond)
        createLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createLayout () {
        
        imageView.snp.makeConstraints { make in
            make.bottom.equalTo(contentView.snp.bottom)
            make.top.equalTo(contentView.snp.top)
            make.right.equalTo(contentView.snp.right)
            make.left.equalTo(contentView.snp.left)
        }
        
        labelFirst.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(10)
            make.top.equalToSuperview().inset(80)
            make.width.equalTo(200)
            make.height.equalTo(30)
            
        }
        labelSecond.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(10)
            make.top.equalTo(imageView.snp.bottom).inset(20)
            make.width.equalTo(200)
            make.height.equalTo(30)
            
        }
        
    }
}
