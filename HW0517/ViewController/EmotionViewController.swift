//
//  EmotionViewController.swift
//  HW0517
//
//  Created by J Oh on 5/18/24.
//

import UIKit

class EmotionViewController: UIViewController {
    
    @IBOutlet var barItemButton: UIBarButtonItem!
    
    @IBOutlet var emotionButtons: [UIButton]!
    @IBOutlet var emotionLabels: [UILabel]!
    
    var count: [Int] = [0,0,0,0,0,0,0,0,0]
    let images: [String] = ["slime1", "slime2", "slime3",
                            "slime4", "slime5", "slime6",
                            "slime7", "slime8", "slime9"]
    let emotions: [String] = ["행복해", "좋아해", "사랑해",
                              "당황해", "속상해", "안심해",
                              "무서워", "우울해", "슬퍼"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        barItemButton.tintColor = .black
        
        designAllButtons()
        designAllLabels()
        
    }
    
    @IBAction func emotionTapped(_ sender: UIButton) {
        let tag = sender.tag
        count[tag] += 1
        emotionLabels[tag].text = "\(emotions[tag]) \(count[tag])"
    }
    
    func designAllButtons() {
        for i in 0...8 {
            emotionButtons[i].setImage(UIImage(named: images[i]), for: .normal)
            emotionButtons[i].setTitle("", for: .normal)
            emotionButtons[i].contentMode = .scaleAspectFit
        }
    }
    
    func designAllLabels() {
        for i in 0...8 {
            emotionLabels[i].text = "\(emotions[i]) 0"
            emotionLabels[i].textAlignment = .center
            emotionLabels[i].textColor = .black
        }
    }

}
