//
//  HomeViewController.swift
//  SoundCloud
//
//  Created by Даша Волошина on 3.10.22.

import UIKit
import SnapKit


class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var model = ModelViewController()
    
    var collectionView: UICollectionView!
//    var images = UIImageView()
//    var dataSource: UICollectionViewDiffableDataSource<Section,Storys>!

//    var story:[UIImage] = [ UIImage(named: "1")!,
//                             UIImage(named: "2")!,
//                             UIImage(named: "3")!,
//                             UIImage(named: "4")!,
//                             UIImage(named: "5")!,
//                             UIImage(named: "6")!,
//                             UIImage(named: "7")!,
//                             UIImage(named: "8")!,
//                             UIImage(named: "9")!]
//    var text:[String] = ["1","2","3","4","5","6","7","8","9",]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: createCollectionViewLayout())

        collectionView.register(CollectionViewCell.self,forCellWithReuseIdentifier: CollectionViewCell.id)
        
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
            make.right.equalTo(view.snp.right)
            make.left.equalTo(view.snp.left)
            
        }
        collectionView.dataSource = self
        collectionView.delegate = self
        
                
//        createDataSource()
   
     
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        loadData()
    }
    
    
//    func loadData(){
//
//        var snapShot = NSDiffableDataSourceSnapshot<Section,Storys>()
//
//        snapShot.appendSections([.sectionStorys])
//        snapShot.appendItems(story, toSection: .sectionStorys)
//        dataSource.applySnapshotUsingReloadData(snapShot)
//    }
    
//    func createDataSource() {
//
//        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Storys> {
//
//            cell,indexPath,itemIdetifier in
//
//            var contenConfiguration = cell.defaultContentConfiguration()
//
//            contenConfiguration.text = itemIdetifier.label
//
//
//            contenConfiguration.image = itemIdetifier.imageName
//
//            contenConfiguration.imageProperties.cornerRadius = 60
//
//            contenConfiguration.textProperties.numberOfLines = 0
//            contenConfiguration.imageToTextPadding = 30
//            contenConfiguration.textProperties.alignment = .center
//
//
//
//
//            cell.contentConfiguration = contenConfiguration
//
//        }
//
//        dataSource = UICollectionViewDiffableDataSource<Section,Storys>(collectionView: collectionView) {
//            collectionView, indexPath, itemIdetifier in
//
//            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdetifier)
//
//            return cell
//        }
      
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.id, for: indexPath) as! CollectionViewCell
        var contenConfiguration = UIListContentConfiguration.cell()
        
//        cell.imageView.image = story[indexPath.row]
//
        
            
        contenConfiguration.image = UIImage(named: model.storys[indexPath.row])
         
            contenConfiguration.imageProperties.cornerRadius = 40
        
//        contenConfiguration.text = text[indexPath.row]
//        cell.label.text = contenConfiguration.text
       
        cell.contentConfiguration = contenConfiguration
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.storys.count
    }
    
    func createCollectionViewLayout() -> UICollectionViewCompositionalLayout {

        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1)))

        
                                              
        let groupItem = NSCollectionLayoutGroup.horizontal(layoutSize:NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),heightDimension: .fractionalHeight(0.1)),subitems: [item])
    
//        groupItem.interItemSpacing = .flexible(2)
                                              
            let section = NSCollectionLayoutSection(group: groupItem )
                section.orthogonalScrollingBehavior = .continuous

            
            

            return UICollectionViewCompositionalLayout(section: section)
        }

}
