//
//  EmotionViewController.swift
//  HW0517
//
//  Created by J Oh on 5/18/24.
//

import UIKit

class EmotionViewController: UIViewController {
    
    @IBOutlet var emotionButtons: [UIButton]!
    @IBOutlet var emotionLabels: [UILabel]!
    
    @IBOutlet var resetButton: UIBarButtonItem!
    
    
    var count: [Int] = [0,0,0,0,0,0,0,0,0]
    let images: [String] = ["slime1", "slime2", "slime3",
                            "slime4", "slime5", "slime6",
                            "slime7", "slime8", "slime9"]
    let emotions: [String] = ["행복해", "좋아해", "사랑해",
                              "당황해", "속상해", "안심해",
                              "무서워", "우울해", "슬퍼"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        count = fetchCount()
        
        resetButton.title = "Reset"
        
        designAllButtons()
        designAllLabels()
        
    }
    
    @IBAction func emotionTapped(_ sender: UIButton) {
        let tag = sender.tag
        count[tag] += 1
        emotionLabels[tag].text = "\(emotions[tag]) \(count[tag])"
        UserDefaults.standard.set(count, forKey: "emotionCount")
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
            emotionLabels[i].text = "\(emotions[i]) \(count[i])"
            emotionLabels[i].textAlignment = .center
            emotionLabels[i].textColor = .black
        }
    }
    
    func resetEmotionCount() {
        count = [0,0,0,0,0,0,0,0,0]
        for i in 0...8 {
            emotionLabels[i].text = "\(emotions[i]) \(count[i])"
        }
    }
    
    func fetchCount() -> [Int] {
        let fetchCount = UserDefaults.standard.object(forKey: "emotionCount") as? [Int]
        return fetchCount ?? [0,0,0,0,0,0,0,0,0]
    }
    
    @IBAction func resetButtonTapped(_ sender: UIBarButtonItem) {
        resetEmotionCount()
        UserDefaults.standard.set(count, forKey: "emotionCount")
    }
    
    
    
    
    

}
