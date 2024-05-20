//
//  WordViewController.swift
//  HW0517
//
//  Created by J Oh on 5/18/24.
//

import UIKit

class WordViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    
    @IBOutlet var termButtons: [UIButton]!
    
    @IBOutlet var resultBackgroundImageView: UIImageView!
    
    @IBOutlet var resultLabel: UILabel!
    
    
    let keys = ["삼귀자", "윰차", "실매", "만반잘부",
                "꾸안꾸", "꾸웨엑", "내또출"]
    
    let values = ["연애를 시작하기 전 썸 단계", "1. 유명인과 무명인을 차별한다는 뜻\n2. 유모차",
                  "실시간 매니저", "만나서 반가워 잘 부탁해!",
                  "꾸민듯 안꾸민듯 자연스러운 모습", "후회해", "내일 또 출근함"]
    
    let searchDic = ["삼귀자": "연애를 시작하기 전 썸 단계!",
                     "윰차": "1. 유명인과 무명인을 차별한다는 뜻\n2. 유모차",
                     "실매": "실시간 매니저",
                     "만반잘부": "만나서 반가워 잘 부탁해!",
                     "꾸안꾸": "꾸민듯 안꾸민듯 자연스러운 모습",
                     "꾸웨엑": "후회해",
                     "내또출": "내일 또 출근함"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
          
        designSearchTextField()
        designTermButtons()
        designSearchButton()
        designResultView()
         
    }
    
    // 돋보기 눌렀을 때 검색어로 검색, 네모 버튼 제목 셔플
    @IBAction func searchButtonTapped(_ sender: UIButton) {
        searchByArray()
        let newKeys = keys.shuffled()
        for i in 0...3 {
            termButtons[i].setTitle(newKeys[i], for: .normal)
        }
        
        view.endEditing(true)
    }
    
    // 네모 버튼 눌렀을 때, 네모의 문자열로 인덱스 검색
    @IBAction func termTapped(_ sender: UIButton) {
        let tag = sender.tag
        let searchText = termButtons[tag].titleLabel?.text ?? ""
        searchTextField.text = searchText
        resultLabel.text = "검색 결과가 없습니다..."
        for key in keys {
            if key.lowercased() == searchText.lowercased() {
                if let idx = keys.firstIndex(of: searchText) {
                    resultLabel.text = values[idx]
                }
            }
        }
    }
    
    // 배열로 검색 - 검색어를 keys에서 찾아 values값을 결과로
    func searchByArray() {
        let searchText = searchTextField.text!.lowercased()
        resultLabel.text = "검색 결과가 없습니다..."
        for key in keys {
            if key.lowercased() == searchText {
                if let idx = keys.firstIndex(of: searchText) {
                    resultLabel.text = values[idx]
                }
            }
        }
    }
    
    // 사전으로 검색 - 검색어를 Dic에 넣어서
    func searchByDictionary() {
        let searchText = searchTextField.text!.lowercased()
        if let result = searchDic[searchText] {
            resultLabel.text = result
        } else {
            resultLabel.text = "검색 결과가 없습니다..."
        }
        
        let list = Array(searchDic.keys).shuffled()
        for i in 0...3 {
            termButtons[i].setTitle(list[i], for: .normal)
        }
        
    }
    
    // 디자인 -------------------------------------------------
    func designTermButtons() {
        for i in 0...3 {
            termButtons[i].setTitle(keys[i], for: .normal)
            termButtons[i].layer.cornerRadius = 5
            termButtons[i].layer.borderWidth = 1
            termButtons[i].titleLabel?.font = UIFont.systemFont(ofSize: 14)
        }
    }
    
    func designSearchTextField() {
        searchTextField.delegate = self
        searchTextField.placeholder = "신조어를 검색해보세요"
        searchTextField.borderStyle = .line
        searchTextField.returnKeyType = .search
    }
    
    func designSearchButton() {
        searchButton.setTitle("", for: .normal)
        searchButton.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        searchButton.backgroundColor = .black
        searchButton.tintColor = .white
    }
    
    func designResultView() {
        resultBackgroundImageView.image = .background
        resultBackgroundImageView.backgroundColor = .clear
        resultBackgroundImageView.contentMode = .scaleAspectFill
        
        resultLabel.text = ""
        resultLabel.numberOfLines = 0
    }
    
    // 리턴 버튼
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchByArray()
        textField.resignFirstResponder()
        return true
    }
}
 
