//
//  searchViewController.swift
//  loginWithFireBase
//
//  Created by Rajeev on 27/04/23.
//

import UIKit
import Firebase
import Photos

class searchViewController: UIViewController {

    
    @IBOutlet weak var newCollectionView: UICollectionView!
    private var images = [PHAsset]()
    @IBOutlet weak var logoutbtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        populatePhotos()
    }
    
    private func setupUI()
    {
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    private func   populatePhotos()
    {
        PHPhotoLibrary.requestAuthorization{[weak self] status in
            if status == .authorized
            {
                let assets = PHAsset.fetchAssets(with: PHAssetMediaType.image,options: nil)
                assets.enumerateObjects { (object,_,_) in
                    
                    self?.images.append(object)
                }
                self?.images.reverse()
                DispatchQueue.main.async {
                    self?.newCollectionView.reloadData()
                }
            }
        }
    }
    
    @IBAction func logOutBtnClick(_ sender: UIBarButtonItem) {
        do
        {
            try FirebaseAuth.Auth.auth().signOut()
           // logoutbtn.removeFromSuperview()
            // logoutbtn.resignFirstResponder()
            
           // self.performSegue(withIdentifier: "ViewController", sender: self)

            print("logout is successful")
        }
        catch
        {
            print("An error occured")
        }
    }
    
}
extension searchViewController:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "galleryimageCollectionViewCell", for: indexPath) as? galleryimageCollectionViewCell else
        {
            fatalError("PhotoCollectionViewCell is not found")
        }
        
        let asset = self.images[indexPath.row]
        let manager = PHImageManager.default()
        
        manager.requestImage(for: asset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFit, options: nil) { image, _ in
            
            print("my img \(image)")
            DispatchQueue.main.async
            {
               // print("my gallery image \(String(describing: image))")
                cell.photoImage.image = image
                cell.layer.cornerRadius = 15
            }
            
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        2
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: newCollectionView.frame.size.width/3-2, height: 150)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath)
    {
        let asset = self.images[indexPath.row]
        let manager = PHImageManager.default()

        manager.requestImage(for: asset, targetSize: CGSize(width: 100, height: 100), contentMode: .aspectFit, options: nil) { image, _ in

            let dataImage = image
           // searchSecondPartViewController.imageA1 = image
            //self.performSegue(withIdentifier: "segue", sender: dataImage)
            
            
            let secondViewController = self.storyboard?.instantiateViewController(withIdentifier: "searchSecondPartViewController") as! searchSecondPartViewController
            searchSecondPartViewController.imageA1 = image
            self.navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
    
}
