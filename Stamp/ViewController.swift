//
//  ViewController.swift
//  Stamp
//
//  Created by YUMAKOMORI on 2016/01/26.
//  Copyright © 2016年 YUMAKOMORI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate,
UINavigationControllerDelegate{
    
    var imageNameArray: [String] = ["hana", "hoshi", "onpu", "shitumon"]
    var imageIndex: Int = 0
    @IBOutlet var haikeiImageView: UIImageView!
    var imageView: UIImageView!
    var imageArray: [UIImageView] = []
    var viewTag:[AnyObject]!
    var count: Int = 1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func selectedFirst() {
        imageIndex = 1
    }
    @IBAction func selectedSecond() {
        imageIndex = 2
    }
    @IBAction func selectedThird() {
        imageIndex = 3
    }
    @IBAction func selectedFourth() {
        imageIndex = 4
    }
    
    
    /*触らない
    let touch: UITouch = (touches.first)!
    let location: CGPoint = touch.locationInView(self.view)
    
    if imageIndex != 0{
    imageView = UIImageView(frame:CGRectMake(0, 0, 40, 40))
    let image: UIImage = UIImage(named: imageNameArray[imageIndex - 1])!
    imageView.image = image
    imageView.center = CGPointMake(location.x, location.y)
    imageView.tag = count
    imageArray.append(imageView)
    NSLog("hoge%@",String(imageArray[count-1]))
    
    
    self.view.addSubview(imageArray[count-1])
    count++
    
    NSLog("%d",count)
    }
    */
    
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        
        let touch: UITouch = (touches.first)!
        let location: CGPoint = touch.locationInView(self.view)
        
        if imageIndex != 0{
            imageView = UIImageView(frame:CGRectMake(0, 0, 40, 40))
            let image: UIImage = UIImage(named: imageNameArray[imageIndex - 1])!
            imageView.image = image
            imageView.center = CGPointMake(location.x, location.y)
            self.view.addSubview(imageView)
        }
        
    }
    
    
    override func touchesMoved(touches: Set<UITouch>,withEvent event: UIEvent?) {
        
        //指を動かしているとき(ドラッグ)にときにしたいことを書く
        
        let touch: UITouch = (touches.first)!
        let location: CGPoint = touch.locationInView(self.view)
        
        if imageIndex != 0{
            imageView.center = CGPointMake(location.x, location.y)
        }
        
    }
    
    override func touchesEnded(touches: Set<UITouch>,
        
        withEvent event: UIEvent?) {
            
            //タッチが終わったときにしたいことを書く
            if imageIndex != 0{
                
                imageView.tag = count
                imageArray.append(imageView)
                
                
                
                count++
                
                NSLog("%d",count)
            }
    }
    
    
    @IBAction func back() {
        if count > 1{
            var fetchedView = self.imageArray[count-2].viewWithTag(count-1)
            fetchedView?.removeFromSuperview()
            imageArray.removeAtIndex(count-2)
            count--
            NSLog("%d",count)
        }
        
        
    }
    
    @IBAction func selectBackground () {
        
        let imagePickerController: UIImagePickerController = UIImagePickerController()
        
        imagePickerController.delegate = self
        
        imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        
        imagePickerController.allowsEditing = true
        
        self.presentViewController(imagePickerController, animated: true, completion: nil)
     
        NSLog("hoge")
    }
    

    
    @IBAction func save() {
        let rect: CGRect = CGRectMake(0, 30, 320, 380)
        UIGraphicsBeginImageContext(rect.size)
        self.view.layer.renderInContext(UIGraphicsGetCurrentContext()!)
        let capture = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        UIImageWriteToSavedPhotosAlbum(capture, nil, nil, nil)
        
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info:[String : AnyObject]) {
        NSLog("hoge")
        
        let image: UIImage = info[UIImagePickerControllerEditedImage] as! UIImage
        haikeiImageView.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    

    
    
    
}
