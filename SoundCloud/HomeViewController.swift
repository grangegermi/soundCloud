//
//  HomeViewController.swift
//  SoundCloud
//
//  Created by Даша Волошина on 3.10.22.

import UIKit
import SnapKit


class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    let model = MockData.shared.allSection
    
    var collectionView: UICollectionView!
    //    var images = UIImageView()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: createCollectionViewLayout())
        collectionView.register(CollectionViewCell.self,forCellWithReuseIdentifier: CollectionViewCell.id)
        collectionView.register(CellForUpload.self,forCellWithReuseIdentifier:CellForUpload.id)
        
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.top.equalTo(view.snp.top)
            make.bottom.equalTo(view.snp.bottom)
            make.right.equalTo(view.snp.right)
            make.left.equalTo(view.snp.left)
            
        }
        collectionView.dataSource = self
        collectionView.delegate = self
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
    //    func loadData(){
    //
    //        var snapShot = NSDiffableDataSourceSnapshot<Sections,StorysItem>()
    //        snapShot.appendSections([.storys])
    //        snapShot.appendItems(model.story, toSection: .storys)
    //        dataSource.applySnapshotUsingReloadData(snapShot)
    //    }
    //
    //    func createDataSource() {
    //
    ////        let cellRegistration = UICollectionView.CellRegistration<UICollectionViewCell, Cat> {
    ////
    ////            cell,indexPath,itemIdetifier in
    ////            var contenConfiguration = UIListContentConfiguration.cell()
    ////            contenConfiguration.text = itemIdetifier.name
    ////           var dateFormatter = DateFormatter()
    ////            dateFormatter.dateStyle = .short
    ////            dateFormatter.timeStyle = .short
    ////            contenConfiguration.secondaryText = dateFormatter.string(from: itemIdetifier.dateBirthday)
    ////            cell.contentConfiguration = contenConfiguration
    ////
    ////        }
    //        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView) {collectionView,indexPath,itemIdentifier in
    //        dataSource = UICollectionViewDiffableDataSource<Sections,StorysItem>(collectionView: collectionView, cellProvider: { (collectionView, indexPath, intValue) -> UICollectionViewCell? in
    //
    //            let section = Sections.Type
    //
    //            switch section {
    //            case .storys.hashValue:
    //                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.id, for: indexPath) as! CollectionViewCell
    //                return cell
    //            case .upload.hashValue:
    //                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellForUpload.id, for: indexPath) as!  CellForUpload
    //            }
    //        }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
          return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
             return model[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch model[indexPath.section]{
            
        case .storys(let story):
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.id, for: indexPath) as! CollectionViewCell
            cell.imageView.image = UIImage(named: story[indexPath.row].image)
            cell.imageView.layer.cornerRadius = 40
            cell.label.text = story[indexPath.row].title
            
            return cell
            
        case .upload(let upload):
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellForUpload.id, for: indexPath) as!
            CellForUpload
            
            cell.imageView.image = UIImage(named: upload[indexPath.row].title)
            cell.labelFirst.text = "THe Upload"
            cell.labelSecond.text = "THe"
            
            return cell
        }
    }
    
    
    
    func createCollectionViewLayout() -> UICollectionViewCompositionalLayout { UICollectionViewCompositionalLayout {
        [weak self] sectionIndex, _  in
        
        guard let self = self else{return}
        
        let section = self.model[sectionIndex]
        
        switch section {
        case .storys(_):
            
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.2), heightDimension: .fractionalHeight(1)))
            
            let groupItem = NSCollectionLayoutGroup.horizontal(layoutSize:NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),heightDimension: .fractionalHeight(0.1)),subitems: [item])
            groupItem.interItemSpacing = .flexible(10)
            
            let section = NSCollectionLayoutSection(group: groupItem )
            section.orthogonalScrollingBehavior = .continuous
            
            return section
            
        case .upload(_):
            
            let item = NSCollectionLayoutItem(layoutSize: (NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalWidth(1))))
            
            let groupItem = NSCollectionLayoutGroup.horizontal(layoutSize:NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),heightDimension: .fractionalHeight(0.5)),subitems: [item])
            
            let section = NSCollectionLayoutSection(group: groupItem)
            
            return section
        }
        
    }
    }
}
