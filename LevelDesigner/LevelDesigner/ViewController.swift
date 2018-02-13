//
//  ViewController.swift
//  LevelDesigner
//
//  Created by 杨青山 on 31/1/18.
//  Copyright © 2018 nus.cs3217.a0101010. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIActionSheetDelegate{
    

    @IBOutlet var gameArea: UIView!
    @IBOutlet var gamebubble1: UIScrollView!
    @IBOutlet var gamebubble2: UIScrollView!
    @IBOutlet var gamebubble3: UIScrollView!
    @IBOutlet var gamebubble4: UIScrollView!
    @IBOutlet var gamebubble5: UIScrollView!
    @IBOutlet var gamebubble6: UIScrollView!
    @IBOutlet var movingBubble: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImage(named: "background.png")
        let background = UIImageView(image: backgroundImage)
        
        let gameViewHeight = gameArea.frame.size.height
        let gameViewWidth = gameArea.frame.size.width
        
        background.frame = CGRect(x: 0, y: 0, width: gameViewWidth, height: gameViewHeight)
        
        let gamebubble = [gamebubble1,gamebubble2,gamebubble3,gamebubble4,gamebubble5,gamebubble6]
        
        gameArea.addSubview(background)
        
        for area in gamebubble{
            gameArea.addSubview(area!)
            gameArea.addSubview(movingBubble)
            gameArea.bringSubview(toFront: area!)
            gameArea.bringSubview(toFront: movingBubble)
            area!.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(taphandle(sender:))))
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
       
    }


    @IBAction func buttonPressed(_ sender: Any) {
        let button = sender as! UIButton
        var newColor: UIColor
        if button.titleColor(for: UIControlState.normal) == UIColor.blue {
            newColor = UIColor.lightGray
        }else{
            newColor = UIColor.blue
        }
        button.setTitleColor(newColor, for: UIControlState.normal)
    }
 
    private var colorchosen:String = "IMG_2916.png"
    @IBAction func ColorPressed(_ sender: Any) {
        let colorbutton = sender as! UIButton
        if colorbutton.currentTitle != nil{
            colorchosen = colorbutton.currentTitle!
        }
    }
    
    func findPosition(sender:UIGestureRecognizer) -> [Int]{
        var indexRow = 1+Int(sender.location(in: gameArea).x)/32
        let indexCol:Int = Int((Double(sender.location(in:gameArea).y) - 4.287)/55.4256)+1
        var index:Int = 0
        if indexCol % 2 == 0{
            index += 12
            indexRow -= 1
        }
        index += (indexRow + 1)/2
        let num = Int((indexCol + 1)/2)
        return [num,index]
    }
    
    @objc func taphandle(sender: UITapGestureRecognizer){
        super.viewDidLoad()
        
        let gamebubble = [gamebubble1,gamebubble2,gamebubble3,gamebubble4,gamebubble5,gamebubble6]
        
        if let thebubble :UIImageView = gamebubble[findPosition(sender: sender)[0] - 1]!.subviews[findPosition(sender: sender)[1] - 1] as? UIImageView{
            thebubble.image = UIImage(named:colorchosen)
        }
        
        
        

        
        
    }
}
    

    


