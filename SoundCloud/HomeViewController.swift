//
//  HomeViewController.swift
//  SoundCloud
//
//  Created by Даша Волошина on 3.10.22.
//

import UIKit
import SnapKit

enum Section: Hashable {
    case sectionStorys
}

struct Storys: Hashable {
    
    var label: String
    var imageName: UIImage
    
    init(label:String, imageName:UIImage){
        self.label = label
        self.imageName = imageName
    }
    
}

class HomeViewController: UIViewController {

    
    var collectionView: UICollectionView!
    var images = UIImageView()
    var dataSource: UICollectionViewDiffableDataSource<Section,Storys>!
    
    var story:[Storys] = [Storys(label: "number 1", imageName:UIImage(named: "1")!),
                          Storys(label: "number 2", imageName:UIImage(named: "2")!),
                          Storys(label: "number 3", imageName:UIImage(named: "3")!),
                          Storys(label: "number 4", imageName:UIImage(named: "4")!),
                          Storys(label: "number 5", imageName:UIImage(named: "5")!),
                          Storys(label: "number 6", imageName:UIImage(named: "6")!),
                          Storys(label: "number 7", imageName:UIImage(named: "7")!),
                          Storys(label: "number 8", imageName:UIImage(named: "8")!),
                          Storys(label: "number 9", imageName:UIImage(named: "9")!)]
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: createCollectionViewLayout())

        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
            make.right.equalTo(view.snp.right)
            make.left.equalTo(view.snp.left)
            
        }
        
                
        createDataSource()
   
     
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        loadData()
    }
    
    
    func loadData(){
        
        var snapShot = NSDiffableDataSourceSnapshot<Section,Storys>()
        
        snapShot.appendSections([.sectionStorys])
        snapShot.appendItems(story, toSection: .sectionStorys)
        dataSource.applySnapshotUsingReloadData(snapShot)
    }
    
    func createDataSource() {

        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewListCell, Storys> {

            cell,indexPath,itemIdetifier in
            
            var contenConfiguration = cell.defaultContentConfiguration()
            
            contenConfiguration.text = itemIdetifier.label
            
      
            contenConfiguration.image = itemIdetifier.imageName
            
            cell.contentConfiguration = contenConfiguration


        }
        
        dataSource = UICollectionViewDiffableDataSource<Section,Storys>(collectionView: collectionView) {
            collectionView, indexPath, itemIdetifier in
            
            let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdetifier)
            
            return cell
        }
      
    }
    
    func createCollectionViewLayout() -> UICollectionViewLayout {

        let setionProvider = { (int:Int,
                                enviroment:NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection in
//MARK: - item with photos
            
            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension:.fractionalHeight(1))

            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSizeforItem = NSCollectionLayoutSize(widthDimension: .absolute(200), heightDimension: .absolute(200))

            let groupItem = NSCollectionLayoutGroup.horizontal(layoutSize:  groupSizeforItem , subitems: [item])
            
//MARK: - label Item
            
            let itemLabelSize = NSCollectionLayoutSize(widthDimension: .fractionalHeight(1), heightDimension: .fractionalHeight(1))
            
            let itemLabel = NSCollectionLayoutItem(layoutSize: itemLabelSize )
            
            let groupLabelSize = NSCollectionLayoutSize(widthDimension:.fractionalWidth(1), heightDimension: .fractionalHeight(1))
            
            let groupLabel = NSCollectionLayoutGroup.horizontal(layoutSize: groupLabelSize, subitems: [itemLabel])
            
           
            
//MARK: - Group all
            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
            
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [groupItem,groupLabel])
            
          
            let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous

                return section

            }

            return UICollectionViewCompositionalLayout(sectionProvider: setionProvider)
        }

}
