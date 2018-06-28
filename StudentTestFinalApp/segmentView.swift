//
//  segmentView.swift
//  StudentTestFinalApp
//
//  Created by Hitendra Dubey on 28/06/18.
//  Copyright © 2018 Hitendra Dubey. All rights reserved.
//

import UIKit

@IBDesignable
class segmentView: UIControl {
    
    var selector:UIView!
    
    @IBInspectable
    var buttons = [UIButton]()
    
    @IBInspectable
    var borderWidth: CGFloat = 0 {
        
        didSet{
            layer.borderWidth = borderWidth
        }
        
    }
    
    @IBInspectable
    var borderColour: UIColor = UIColor.clear
    {
        
        didSet{
            layer.borderColor = borderColour.cgColor
            
        }
        
    }
    
    @IBInspectable
    var commaSeperatedButtonTitles: String = ""
    {
        didSet{
            
            updateView()
        }
    }
    
    @IBInspectable
    var textColour: UIColor = .black
    {
        didSet{
            updateView()
        }
        
    }
    
    @IBInspectable
    var selectorColour:UIColor = .blue
    {
        didSet{
            updateView()
        }
    }
    
    @IBInspectable
    var selectorTextColour: UIColor = .blue
    {
        didSet{
            updateView()
            
        }
    }
    
    func updateView()
    {
        buttons.removeAll()
        subviews.forEach { (view) in
            view.removeFromSuperview()
        }
        
        let buttonTitles = commaSeperatedButtonTitles.components(separatedBy: ",")
        
        for buttonTitle in buttonTitles
        {
            let button = UIButton(type: .system)
            button.setTitle(buttonTitle, for: .normal)
            button.addTarget(self, action: #selector(buttonTapped(button:)), for: .touchUpInside)
            //button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
            button.titleLabel?.font.withSize(15)
            button.setTitleColor(textColour, for: .normal)
            buttons.append(button)
        }
        
        buttons[0].setTitleColor(selectorTextColour, for: .normal)
        
        let widthOfButton = frame.width / CGFloat(buttonTitles.count)
        selector = UIView(frame: CGRect(x: 2, y: self.frame.height - 15, width: widthOfButton-2, height: 3))
        //selector.layer.cornerRadius = frame.height/2
        selector.backgroundColor = selectorColour
        addSubview(selector)
        
        let stackView = UIStackView(arrangedSubviews: buttons)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
       // stackView.spacing = 2
        stackView.backgroundColor = UIColor.lightGray
        addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        stackView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        stackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    @objc func buttonTapped(button:UIButton)
    {
        for (buttonIndex, btn) in buttons.enumerated()
        {
            btn.setTitleColor(textColour, for: .normal)
            
            if btn == button
            {
                let selectorStartPosition = frame.width / CGFloat(buttons.count) * CGFloat(buttonIndex) + 2
                UIView.animate(withDuration: 0.3, animations: {
                self.selector.frame.origin.x = selectorStartPosition
                
                })
                btn.setTitleColor(selectorTextColour, for: .normal)
            }
        }
        
        
    }
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
     */
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
 

}
