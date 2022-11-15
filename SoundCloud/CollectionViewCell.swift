//
//  CollectionCellCollectionViewCell.swift
//  SoundCloud
//
//  Created by Даша Волошина on 11.11.22.
//

import UIKit


class CollectionViewCell: UICollectionViewCell {
    
    static let id = "CollectionViewCell"
    let label = UILabel()
    let imageView = UIImageView()
    
    
    override init(frame:CGRect){
        super.init(frame:frame)
    
  
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        createLayout()
    
   
//        imageView.contentMode = .scaleAspectFit
     
      
        
////        let images:[UIImage] = [ UIImage(named:"1"),
////                                 UIImage(named: "2"),
////                                 UIImage(named: "3"),
////                                 UIImage(named: "4"),
////                                 UIImage(named: "5"),
////                                 UIImage(named: "6"),
////                                 UIImage(named: "7"),
////                                 UIImage(named: "8"),
////                                 UIImage(named: "9"), ].compactMap({$0})
//        
//        
//        
//        let texts:[String] = ["1","2","3","4","5","6","7","8","9"]
//        
//        imageView.image = images.randomElement()
//        imageView.contentMode = .scaleAspectFill
//        label.text = texts.randomElement()
                                
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
    func configure(image:UIImage,text:String) {
        
        label.text = text
        imageView.image = image
    }
    
}
