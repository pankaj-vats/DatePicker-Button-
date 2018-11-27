//
//  ViewController.swift
//  DatePicker
//
//  Created by Himanshu Chimanji on 27/11/18.
//  Copyright © 2018 Himanshu Chimanji. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var bp2: UIButton!
    @IBOutlet weak var donebtn: UIButton!
    @IBOutlet weak var bp: UIButton!
    @IBOutlet weak var dp: UIDatePicker!
    @IBOutlet weak var label: UILabel!
    
    var whichButton = String()
    var firstButton = String()
    var secondButton = String()
    
//    TO GET CALNEDER & DATE FROM IT
    
    let userCalender = NSCalendar.current
    let requestedComponent: Set<Calendar.Component> = [.day]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dp.isHidden = true
        donebtn.isHidden = true

    }

    @IBAction func cp2(_ sender: UIButton) {
        dp.isHidden = false
        donebtn.isHidden = false
        whichButton = "Second Button"
        //        let dp : UIDatePicker = UIDatePicker()
        dp.datePickerMode = .date
        dp.addTarget(self, action: #selector(dueDateChanged(sender:)), for: UIControl.Event.valueChanged)
        let pickerSize : CGSize = dp.sizeThatFits(CGSize.zero)
        dp.frame = CGRect(x:0.0, y:250, width:pickerSize.width, height:460)
        // you probably don't want to set background color as black
        // picker.backgroundColor = UIColor.blackColor()
        self.view.addSubview(dp)
    }
    
    @IBAction func cp(_ sender: UIButton) {
       
        dp.isHidden = false
        donebtn.isHidden = false
        whichButton = "First Button"
//        let dp : UIDatePicker = UIDatePicker()
        dp.datePickerMode = .date
        dp.addTarget(self, action: #selector(dueDateChanged(sender:)), for: UIControl.Event.valueChanged)
        let pickerSize : CGSize = dp.sizeThatFits(CGSize.zero)
        dp.frame = CGRect(x:0.0, y:250, width:pickerSize.width, height:460)
        // you probably don't want to set background color as black
        // picker.backgroundColor = UIColor.blackColor()
        self.view.addSubview(dp)
    }
    
    @objc func dueDateChanged(sender:UIDatePicker){
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .none
        
        if whichButton == "First Button"
        {
            bp.setTitle(dateFormatter.string(from: sender.date), for: .normal)
            firstButton = dateFormatter.string(from: sender.date)
            print("First Button\(firstButton)")

        }
        else
        {
            bp2.setTitle(dateFormatter.string(from: sender.date), for: .normal)
            secondButton = dateFormatter.string(from: sender.date)
            print("Second Button\(secondButton)")
           
            let startTime = dateFormatter.date(from: firstButton)
            let endTime = dateFormatter.date(from: secondButton)

            let timeDifference = userCalender.dateComponents(requestedComponent, from: startTime!, to: endTime!)
            label.text = ("\(String(timeDifference.day!))Day")
            print(timeDifference)
        }
    }
    
    @IBAction func dbb(_ sender: UIButton) {
        dp.isHidden = true
        donebtn.isHidden = true

    }
}

