//
//  ProjectViewController.swift
//  DiegoDosSantos
//
//  Created by Diego dos Santos on 4/21/15.
//  Copyright (c) 2015 Diego dos Santos. All rights reserved.
//

import UIKit

class ProjectViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    var id = "roundtrip"
    var dictionary : NSDictionary!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = setColor()
        self.navigationController?.navigationBar.barStyle = UIBarStyle.Black
        let url = NSBundle.mainBundle().URLForResource("myInfo", withExtension: "plist")
        dictionary = NSDictionary(contentsOfURL: url!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //tableView
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            var cell = tableView.dequeueReusableCellWithIdentifier("firstCell") as! FirstTableViewCell
            cell.titleLabel.text = setTitle()
            cell.titleLabel.font = UIFont(name: "HelveticaNeue-Light", size: 20)
            cell.subtitleLabel.text = "Status: " + setSubtitle()
            cell.subtitleLabel.font = UIFont(name: "HelveticaNeue-Thin", size: 18)
            cell.imageApp.image = setImage()
            self.setImageCustom(cell.imageApp)
            return cell
        }
        if indexPath.row == 1{
            var cell = tableView.dequeueReusableCellWithIdentifier("secondCell") as! SecondTableViewCell
            return cell
        }
        var cell = tableView.dequeueReusableCellWithIdentifier("thirdCell") as! ThirdTableViewCell
        cell.descriptionLabel.text = "Description:"
        cell.descriptionLabel.font = UIFont(name: "HelveticaNeue-Light", size: 18)
        cell.textView.text = setText()
        cell.textView.font = UIFont(name: "HelveticaNeue-Thin", size: 16)
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.row{
        case 0:
            return 117
        case 1:
            if id == "sicce"{
                return 150
            }
            return 340
        default:
            return setCellSize()
        }
    }
    
    //CollectionView
   
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfCellCollection()
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionCell", forIndexPath: indexPath) as! ImageCollectionViewCell
        cell.image.image = setImagesForCollection(indexPath.row)
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        performSegueWithIdentifier("pageControllerSegue", sender: nil)
    }
    
    //Segue
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "pageControllerSegue"{
            var pvc = segue.destinationViewController as! PageViewController
            var number = numberOfCellCollection()
                for i in 0..<number{
                    var imageName = setImagesForCollection(i)
                    pvc.images.append(imageName)
                }
        }
    }
    
    //actions
    
    @IBAction func backPressed(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    //others
    
    func setImagesForCollection(index: Int) -> UIImage{
        switch id{
        case "colabore":
            if index == 0{
                return UIImage(named: "colabore1")!}
            if index == 1{
                return UIImage(named: "colabore2")!}
            return UIImage(named: "colabore3")!
        case "sicce":
            return UIImage(named: "sicce-1")!
        case "routinetask":
            if index == 0{
                return UIImage(named: "routinetask1")!}
            if index == 1{
                return UIImage(named: "routinetask2")!}
            return UIImage(named: "routinetask3")!
        default:
            if index == 0{
                return UIImage(named: "roundtrip1")!}
            if index == 1{
                return UIImage(named: "roundtrip2")!}
            return UIImage(named: "roundtrip3")!
        }
    }
    
    func numberOfCellCollection() -> Int{
        switch id{
        case "colabore":
            return 3
        case "sicce":
            return 1
        case "routinetask":
            return 3
        default:
            return 3
        }
    }
    
    func setCellSize() -> CGFloat{
        switch id{
        case "colabore":
            return 250
        case "routinetask":
            return 220
        case "sicce":
            return 500
        default:
            return 300
        }
    }
    
    func setImageCustom (image: UIImageView){
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 21
        image.layer.borderWidth = 1
        image.layer.borderColor = UIColor(white: 0.8, alpha: 1).CGColor
    }
    
    func setColor() -> UIColor{
        switch id{
        case "colabore":
            return UIColor(red: 231/255, green: 54/255, blue: 51/255, alpha: 1.0)
        case "routinetask":
            return UIColor(red: 255/255, green: 161/255, blue: 68/255, alpha: 1.0)
        case "sicce":
            return UIColor(red: 0/255, green: 140/255, blue: 147/255, alpha: 1.0)
        default:
            return UIColor(red: 74/255, green: 144/255, blue: 226/255, alpha: 1.0)
            
        }
    }
    
    func setTitle() -> String{
        switch id{
        case "colabore":
            return "Colaborê"
        case "routinetask":
            return "RoutineTask"
        case "sicce":
            return "SICCE"
        default:
            return "RoundTrip"
            
        }
    }
    
    func setSubtitle() -> String{
        switch id{
        case "colabore":
            return "Beta Testing with TestFlight"
        case "routinetask":
            return "Available on the App Store"
        case "sicce":
            return "Developing"
        default:
            return "Beta Testing with TestFlight"
            
        }
    }
    
    func setText() -> String{
        var projects = dictionary.objectForKey("projects") as! NSDictionary
        switch id{
        case "colabore":
            return projects.valueForKey("colabore") as! String
        case "routinetask":
            return projects.valueForKey("routinetask") as! String
        case "sicce":
            return projects.valueForKey("sicce") as! String
        default:
            return projects.valueForKey("roundtrip") as! String
            
        }
    }
    
    func setImage() -> UIImage{
        switch id{
        case "colabore":
            return UIImage(named:"AppIcon Colabore")!
        case "routinetask":
            return UIImage(named:"Routine task")!
        case "sicce":
            return UIImage(named:"SICCE")!
        default:
            return UIImage(named:"Roundtrip Icon")!

        }
    }
}
