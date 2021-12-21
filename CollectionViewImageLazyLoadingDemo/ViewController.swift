//
//  ViewController.swift
//  CollectionViewImageLazyLoadingDemo
//
//  Created by Asmita Borawake on 21/12/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var imgData = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        imgData = ["https://bit.ly/3pu2yID",
                   "https://bit.ly/3Esxy1H",
                   "https://bit.ly/3or9ff1",
                   "https://bit.ly/3Gii2Gh",
                   "https://bit.ly/3rEAMf5",
                   "https://bit.ly/2ZVYMig",
                   "https://bit.ly/32SDcMG",
                   "https://bit.ly/3ps6bP3",
                   "https://bit.ly/3GgN2X7",
                   "https://bit.ly/32SX7es",
                   "https://bit.ly/3otiBqU",
                   "https://bit.ly/3ImWMkq",
                   "https://bit.ly/3pu2yID",
                   "https://bit.ly/3Esxy1H",
                   "https://bit.ly/3or9ff1",
                   "https://bit.ly/3Gii2Gh",
                   "https://bit.ly/3rEAMf5",
                   "https://bit.ly/2ZVYMig",
                   "https://bit.ly/32SDcMG",
                   "https://bit.ly/3ps6bP3",
                   "https://bit.ly/3GgN2X7",
                   "https://bit.ly/32SX7es",
                   "https://bit.ly/3otiBqU",
                   "https://bit.ly/3ImWMkq",
                   "https://bit.ly/3pu2yID",
                   "https://bit.ly/3Esxy1H",
                   "https://bit.ly/3or9ff1",
                   "https://bit.ly/3Gii2Gh",
                   "https://bit.ly/3rEAMf5",
                   "https://bit.ly/2ZVYMig",
                   "https://bit.ly/32SDcMG",
                   "https://bit.ly/3ps6bP3",
                   "https://bit.ly/3GgN2X7",
                   "https://bit.ly/32SX7es",
                   "https://bit.ly/3otiBqU",
                   "https://bit.ly/3ImWMkq",
                  ]
    }


}

extension ViewController : UICollectionViewDelegate, UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imgData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell else{
            return UICollectionViewCell()
        }
        if let url = URL(string: imgData[indexPath.row]){
            cell.imgView.loadImage(url: url)
        }
        return cell
        
    }
    
}

extension ViewController : UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        return CGSize(width: collectionViewWidth/2 - 2, height: collectionViewWidth/2 - 2)

    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
}
