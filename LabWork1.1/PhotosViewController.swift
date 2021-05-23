//
//  PhotosViewController.swift
//  LabWork1.1
//
//  Created by Vladislav on 22.05.2021.
//

import UIKit

class PhotosViewController: UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    
    var arrayOfPictures:[UIImage] = []
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        collectionView.collectionViewLayout.invalidateLayout()
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        if let layout = collectionView?.collectionViewLayout as? MyCollectionViewLayout {
            layout.delegate = self
        }
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "MyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "MyCollectionViewCell")
        
    }
     
}

extension PhotosViewController: UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayOfPictures.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCollectionViewCell", for: indexPath) as! MyCollectionViewCell
        cell.configure(image: arrayOfPictures[indexPath.item])

        
        return cell
    }
    
    
}


extension PhotosViewController: MyCollectionViewLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView,heightForPhotoAtIndexPath indexPath:IndexPath) -> CGFloat {
        if((indexPath.item + 1) % 9 == 1 || (indexPath.item + 1) % 9 == 0) {
            return collectionView.frame.width/3*2
        } else{
            return collectionView.frame.width/3
        }
        
    }
}

extension PhotosViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBAction func openPhotos() {
        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true, completion: nil)
        guard let newImage = info[.originalImage] as? UIImage else { return }
        arrayOfPictures.append(newImage)
        collectionView.reloadData()
    }
        

}
