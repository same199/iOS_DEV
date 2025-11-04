//
//  ViewController.swift
//  CircleGame
//
//  Created by LizOk&Same on 30.10.25.
//

import UIKit

class ViewController: UIViewController {
    let circle = UIView()
    let circleSize: CGFloat = 100
    let move: CGFloat = 10
    
    private let forwButton: UIButton = {
        let forvardButton = UIButton()
        forvardButton.setTitle("↑", for: .normal)
        forvardButton.setTitleColor(.systemMint, for: .normal)
        return forvardButton
    }()
    private let backButton: UIButton = {
        let backwardButton = UIButton()
        backwardButton.setTitle("↓", for: .normal)
        backwardButton.setTitleColor(.systemMint, for: .normal)
        return backwardButton
    }()
    private let leButton: UIButton = {
        let leftButton = UIButton()
        leftButton.setTitle("←", for: .normal)
        leftButton.setTitleColor(.systemMint, for: .normal)
        return leftButton
    }()
    private let riButton: UIButton = {
        let rightButton = UIButton()
        rightButton.setTitle("→", for: .normal)
        rightButton.setTitleColor(.systemMint, for: .normal)
        return rightButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        circleSpawn()
    }
    
    func configureUI(){
        view.backgroundColor = UIColor.white
        
        view.addSubview(forwButton)
        forwButton.frame = CGRect(x: (view.frame.width - ButtonsSize.width.rawValue) / 2,
                                  y: 700,
                                  width: ButtonsSize.width.rawValue,
                                  height: ButtonsSize.height.rawValue)
        let forvard = UIAction {_ in self.goForvard()}
        forwButton.addAction(forvard, for: .touchUpInside)
        
        view.addSubview(backButton)
        backButton.frame = CGRect(x: (view.frame.width - ButtonsSize.width.rawValue) / 2,
                                  y: forwButton.frame.origin.y + ButtonsSize.height.rawValue + Offsets.medium.rawValue,
                                  width: ButtonsSize.width.rawValue,
                                  height: ButtonsSize.height.rawValue)
        let back = UIAction {_ in self.goBackward()}
        backButton.addAction(back, for: .touchUpInside)
        
        view.addSubview(leButton)
        leButton.frame = CGRect(x: backButton.frame.origin.x - Offsets.medium.rawValue - ButtonsSize.width.rawValue,
                                y: forwButton.frame.origin.y + Offsets.medium.rawValue,
                                width: ButtonsSize.width.rawValue,
                                height: ButtonsSize.height.rawValue)
        let left = UIAction {_ in self.goLeft()}
        leButton.addAction(left, for: .touchUpInside)
        
        view.addSubview(riButton)
        riButton.frame = CGRect(x: backButton.frame.origin.x + Offsets.medium.rawValue + ButtonsSize.width.rawValue,
                                y: forwButton.frame.origin.y + Offsets.medium.rawValue,
                                width: ButtonsSize.width.rawValue,
                                height: ButtonsSize.height.rawValue)
        let right = UIAction {_ in self.goRight()}
        riButton.addAction(right, for: .touchUpInside)
    }
    
    func goForvard(){
        moveCircle(direction: Directions.forward)
    }
    
    func goBackward(){
        moveCircle(direction: Directions.backward)
    }
    
    func goLeft(){
        moveCircle(direction: Directions.left)
    }
    
    func goRight(){
        moveCircle(direction: Directions.right)
    }
    
    func circleSpawn(){
        let borderX = view.frame.width - circleSize
        let borderY = view.frame.height - circleSize
        let randomX = CGFloat.random(in: 0...borderX)
        let randomY = CGFloat.random(in: 0...borderY)
        circle.frame = CGRect(x: randomX, y: randomY, width: circleSize, height: circleSize)
        circle.layer.cornerRadius = circle.frame.width / 2
        circle.backgroundColor = UIColor.systemRed
        self.view.addSubview(circle)
    }
    
    func moveCircle(direction: Directions){
        switch direction {
        case Directions.forward:
            if circle.frame.origin.y - move >= 0{
                circle.frame.origin.y -= move
            }else{
                return
            }
        case Directions.backward:
            if circle.frame.origin.y + circleSize < forwButton.frame.origin.y{
                circle.frame.origin.y += move
            }else{
                return
            }
        case Directions.left:
            if circle.frame.origin.x - move >= 0{
                circle.frame.origin.x -= move
            }else{
                return
            }
        case Directions.right:
            if circle.frame.origin.x + move <= self.view.frame.width - circleSize{
                circle.frame.origin.x += move
            }else{
                return
            }
        }
    }
}

