//
//  KeyboardViewController.swift
//  muradKeyboard
//
//  Created by md212 on 16/4/20.
//  Copyright © 2016年 murad. All rights reserved.
//
import UIKit

protocol KeyboardDelegate: class {
    func keyDidPressed(kbTag: Int)}

class KeyboardViewController: UIInputViewController {
    weak var delegate:KeyboardDelegate?
    //var targetTextInput:UITextInput!
    var topRow,secondRow,thirdRow,fourthRow:UIView!,topRow1,secondRow1,thirdRow1,fourthRow1:UIView!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //let nib = UINib(nibName: "KeyboardView", bundle: nil)
        //let objects = nib.instantiateWithOwner(self, options: nil)
        //view = objects[0] as! UIView;
        
        /*NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("editingDidBegin:"), name: UITextViewTextDidBeginEditingNotification, object: nil)
         
         NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("editingDidEnd:"), name: UITextViewTextDidEndEditingNotification, object: nil)
         */
        
        let buttonTitles = ["چ", "ۋ", "ې", "ر", "ت", "ي","ۇ","ڭ","و","پ"]
        let buttons = createButtons(buttonTitles,gid: 1)
        let screenSize = UIScreen.mainScreen().bounds
        let screenWidth = screenSize.width
        topRow = UIView(frame: CGRectMake(0, 1, screenWidth, 47))
        for button in buttons {
            topRow.addSubview(button)
        }
        self.view.addSubview(topRow)
        
        
        let buttonTitles5 = ["1","2","3","4","5","6","7","8","9","0"]
        let buttons5 = createButtons(buttonTitles5,gid: 5)
        topRow1 = UIView(frame: CGRectMake(0, 1, screenWidth, 47))
        topRow1.hidden = true
        for button in buttons5 {
            topRow1.addSubview(button)
        }
        self.view.addSubview(topRow1)
        
        
        let buttonTitles2 = ["ھ","س","د","ا","ە","ى","ق","ك","ل","گ","⬅︎"]
        let buttons2 = createButtons(buttonTitles2,gid: 2)
        secondRow = UIView(frame: CGRectMake(0, 56 , screenWidth, 47))
        for button in buttons2 {
            secondRow.addSubview(button)
        }
        self.view.addSubview(secondRow)
        
        let buttonTitles6 = ["!","@","#","$","%","*","(",")","\"","'","⬅︎"]
        let buttons6 = createButtons(buttonTitles6,gid: 6)
        secondRow1 = UIView(frame: CGRectMake(0, 56, screenWidth, 47))
        secondRow1.hidden = true
        for button in buttons6 {
            secondRow1.addSubview(button)
        }
        self.view.addSubview(secondRow1)
        
        let buttonTitles3 = ["ژ","ز","ش","غ","ۈ","ب","ن","م","،",".","ئ‍"]
        let buttons3 = createButtons(buttonTitles3,gid: 3)
        thirdRow = UIView(frame: CGRectMake(0, 111, screenWidth, 47))
        for button in buttons3 {
            thirdRow.addSubview(button)
        }
        self.view.addSubview(thirdRow)
        
        let buttonTitles7 = ["«","»","{","}","[","]","<",">","=","-"]
        let buttons7 = createButtons(buttonTitles7,gid: 7)
        thirdRow1 = UIView(frame: CGRectMake(0, 111, screenWidth, 47))
        thirdRow1.hidden = true
        for button in buttons7 {
            thirdRow1.addSubview(button)
        }
        self.view.addSubview(thirdRow1)
        
        let buttonTitles4 = ["1/2","🌐","ف","ۆ"," ","خ","ج","؟","↵"]
        let buttons4 = createButtons(buttonTitles4,gid: 4)
        fourthRow = UIView(frame: CGRectMake(0, 166, screenWidth, 47))
        for button in buttons4 {
            fourthRow.addSubview(button)
        }
        self.view.addSubview(fourthRow)
        
        let buttonTitles8 = ["2/2","🌐","+","\\"," ","/",":","؛","↵"]
        let buttons8 = createButtons(buttonTitles8,gid: 8)
        fourthRow1 = UIView(frame: CGRectMake(0, 166, screenWidth, 47))
        fourthRow1.hidden = true
        for button in buttons8 {
            fourthRow1.addSubview(button)
        }
        self.view.addSubview(fourthRow1)
        
        addConstraints(buttons, containingView: topRow)
        addConstraints(buttons5, containingView: topRow1)
        addConstraints(buttons2, containingView: secondRow)
        addConstraints(buttons6, containingView: secondRow1)
        addConstraints(buttons3, containingView: thirdRow)
        addConstraints(buttons7, containingView: thirdRow1)
        addConstraints(buttons4, containingView: fourthRow)
        addConstraints(buttons8, containingView: fourthRow1)
        
        //if ((textDocumentProxy as UIKeyInput).returnKeyType == .Search) {
        //        }
        
        // Perform custom UI setup here
        
        //self.nextKeyboardButton = buttons4[1]//UIButton(type: .System)
        
        //self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), forState: .Normal)
        //self.nextKeyboardButton.sizeToFit()
        ////self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        ////self.nextKeyboardButton.addTarget(self, action: "advanceToNextInputMode", forControlEvents: .TouchUpInside)
        
        //self.view.addSubview(self.nextKeyboardButton)
        
        /*
         let nextKeyboardButtonLeftSideConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Left, relatedBy: .Equal, toItem: self.view, attribute: .Left, multiplier: 1.0, constant: 0.0)
         let nextKeyboardButtonBottomConstraint = NSLayoutConstraint(item: self.nextKeyboardButton, attribute: .Bottom, relatedBy: .Equal, toItem: self.view, attribute: .Bottom, multiplier: 1.0, constant: 0.0)
         self.view.addConstraints([nextKeyboardButtonLeftSideConstraint, nextKeyboardButtonBottomConstraint])*/
        
    }
    
    /*override func viewWillDisappear(animated:Bool) {
     super.viewWillDisappear(true)
     NSNotificationCenter.defaultCenter().removeObserver(self, name: UITextViewTextDidBeginEditingNotification, object: nil)
     NSNotificationCenter.defaultCenter().removeObserver(self, name: UITextViewTextDidEndEditingNotification, object: nil)
     }*/
    
    /*func editingDidBegin(notification:NSNotification) {
     if ((notification.object?.conformsToProtocol(UITextInput)) == nil) {
     self.targetTextInput = nil;
     return;
     }
     self.targetTextInput = notification.object as! UITextInput
     }
     
     func editingDidEnd(notification:NSNotification) {
     self.targetTextInput = nil
     }*/
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
    
    override func textWillChange(textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    /*
     override func textDidChange(textInput: UITextInput?) {
     // The app has just changed the document's contents, the document context has been updated.
     var textColor: UIColor
     let proxy = self.textDocumentProxy
     if proxy.keyboardAppearance == UIKeyboardAppearance.Dark {
     textColor = UIColor.whiteColor()
     } else {
     textColor = UIColor.blackColor()
     }
     //self.nextKeyboardButton.setTitleColor(textColor, forState: .Normal)
     }*/
    
    func createButtons(titles: [String], gid: Int) -> [UIButton] {
        
        var buttons = [UIButton]()
        var n = 0
        for title in titles {
            n += 1
            let button = UIButton(type: .System) as UIButton
            button.tag = gid*100+n
            button.setTitle(title, forState: .Normal)
            button.translatesAutoresizingMaskIntoConstraints = false
            let elements = [211,401,402,409,611,801,802,809]
            if ( elements.contains(button.tag) ) {
                button.backgroundColor = UIColor.lightGrayColor()
            } else {
                button.backgroundColor = UIColor.whiteColor()
            }
            
            
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.lightGrayColor().CGColor
            button.titleLabel?.font = UIFont(name: "UKIJ_Mac Basma", size: 18)
            button.setTitleColor(UIColor.blackColor(), forState: .Normal)
            button.addTarget(self, action: #selector(KeyboardViewController.keyPressed(_:)), forControlEvents: .TouchUpInside)
            buttons.append(button)
        }
        
        return buttons
    }
    
    func keyPressed(sender: UIButton) {
        let button = sender
        let title = button.titleForState(.Normal)
        let kbTag=button.tag
        
        switch (kbTag) {
        case 211,611:
            (textDocumentProxy as UIKeyInput).deleteBackward()
            break
        case 401,801:
            charSetPressed(button)
            break
        case 402,802:
            advanceToNextInputMode()
            break
        case 405,805:
            (textDocumentProxy as UIKeyInput).insertText(" ")
        case 409,809:
            (textDocumentProxy as UIKeyInput).insertText("\n")
            break
         default:
            let str = (title! as NSString).substringToIndex(1)
            (textDocumentProxy as UIKeyInput).insertText(str)
            break
        }
        
        UIView.animateWithDuration(0.2, animations: {
            button.transform = CGAffineTransformScale(CGAffineTransformIdentity, 2, 2)
            }, completion: {(_) -> Void in
                button.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1)
        })
        self.delegate?.keyDidPressed(kbTag)
        
        
        
    }
    
    func charSetPressed(button: UIButton) {
        if topRow.hidden == false {
            topRow.hidden = true
            secondRow.hidden = true
            thirdRow.hidden = true
            fourthRow.hidden = true
            topRow1.hidden = false
            secondRow1.hidden = false
            thirdRow1.hidden = false
            fourthRow1.hidden = false
            
        } else {
            topRow.hidden = false
            secondRow.hidden = false
            thirdRow.hidden = false
            fourthRow.hidden = false
            topRow1.hidden = true
            secondRow1.hidden = true
            thirdRow1.hidden = true
            fourthRow1.hidden = true
            
        }
        
    }
    
    func addConstraints(buttons: [UIButton], containingView: UIView){
        
        for (index, button) in buttons.enumerate() {
            
            let topConstraint = NSLayoutConstraint(item: button, attribute: .Top, relatedBy: .Equal, toItem: containingView, attribute: .Top, multiplier: 1.0, constant: 1)
            
            let bottomConstraint = NSLayoutConstraint(item: button, attribute: .Bottom, relatedBy: .Equal, toItem: containingView, attribute: .Bottom, multiplier: 1.0, constant: -1)
            
            var leftConstraint : NSLayoutConstraint!
            
            if index == 0 {
                
                leftConstraint = NSLayoutConstraint(item: button, attribute: .Left, relatedBy: .Equal, toItem: containingView, attribute: .Left, multiplier: 1.0, constant: 1)
                
            }else{
                
                leftConstraint = NSLayoutConstraint(item: button, attribute: .Left, relatedBy: .Equal, toItem: buttons[index-1], attribute: .Right, multiplier: 1.0, constant: 1)
                var mval:CGFloat!
                switch (button.tag) {
                case 405,805:
                    mval = 0.5
                    break
                case 409,809:
                    mval = 0.7
                    break
                default:
                    mval = 1.0
                    
                }
                
                let widthConstraint = NSLayoutConstraint(item: buttons[0], attribute: .Width, relatedBy: .Equal, toItem: button, attribute: .Width, multiplier: mval, constant: 0)
                containingView.addConstraint(widthConstraint)
                
                
            }
            
            var rightConstraint : NSLayoutConstraint!
            
            if index == buttons.count - 1 {
                
                rightConstraint = NSLayoutConstraint(item: button, attribute: .Right, relatedBy: .Equal, toItem: containingView, attribute: .Right, multiplier: 1.0, constant: -1)
                
            }else{
                
                rightConstraint = NSLayoutConstraint(item: button, attribute: .Right, relatedBy: .Equal, toItem: buttons[index+1], attribute: .Left, multiplier: 1.0, constant: -1)
            }
            
            containingView.addConstraints([topConstraint, bottomConstraint, rightConstraint, leftConstraint])
        }
    }
    
}
