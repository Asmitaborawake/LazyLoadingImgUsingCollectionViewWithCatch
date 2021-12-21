//
//  CustomImageView.swift
//  CollectionViewImageLazyLoadingDemo
//
//  Created by Asmita Borawake on 21/12/21.
//

import Foundation
import UIKit

class CustomImageView : UIImageView {
    
    var task : URLSessionDataTask!
    var imgCatch = NSCache<AnyObject, AnyObject>()
    func loadImage(url : URL){
        //set image to nil bcz not to overlap one image to other image while scrolling
        image = nil
        //check task if previous taskmis going then cancel it and start new task again
        if let task = task{
            task.cancel()
        }
        //check if image is in catche assign it to imageview
        if let imageFromCatch = imgCatch.object(forKey: url.absoluteString as AnyObject) as? UIImage{
            self.image = imageFromCatch
            return
        }
        //session to get image from url
        task = URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data , let newImage  = UIImage(data: data) else {
                print("could not load image from url: \(url)")
                return
            }
            //set image to catche storage for future call check
            self.imgCatch.setObject(newImage, forKey: url.absoluteString as AnyObject)
            //set ui in main queue
            DispatchQueue.main.async {
                self.image = newImage
            }
            
        }
        task.resume()
    }
}
