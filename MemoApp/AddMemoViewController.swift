//
//  AddMemoViewController.swift
//  MemoApp
//
//  Created by Ryo Motoki on 2017/11/01.
//  Copyright © 2017年 RyoMotoki. All rights reserved.
//

import UIKit

class AddMemoViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet var memoTextView: UITextView!
    //発展
    @IBOutlet var titleTextField: UITextField!
    
    @IBOutlet var genrePickerView: UIPickerView!
    var genreTitle = ["就活", "勉強", "遊び"]
    @IBOutlet var selectGenreLabel: UILabel!
    var selectGenreTitle: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        genrePickerView.dataSource = self
        genrePickerView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return genreTitle.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return genreTitle[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        selectGenreLabel.text = genreTitle[row]
        selectGenreTitle = genreTitle[row]
    }
    
    //発展
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func save() {
        let inputText = memoTextView.text
        let inputTitle = titleTextField.text
        let ud = UserDefaults.standard
        if ud.array(forKey: "memoAllArray") != nil {
            var saveMemoArray = ud.array(forKey: "memoAllArray") as! [[String]]
            
            if inputText?.count != 0 && inputTitle?.count != 0 {
                saveMemoArray.append([inputTitle!, inputText!])
                ud.set(saveMemoArray, forKey: "memoAllArray")
                ud.synchronize()
                self.dismiss(animated: true, completion: nil)
            } else {
                print("何も入力されていません")
            }
            
        } else {
            var newMemoArray = [[String]]()
            
            if inputText?.count != 0 && inputTitle?.count != 0 {
                newMemoArray.append([inputTitle!, inputText!])
                ud.set(newMemoArray, forKey: "memoAllArray")
                ud.synchronize()
                self.dismiss(animated: true, completion: nil)
            } else {
                print("何も入力されていません")
            }
        }
    }
    
    //発展
    @IBAction func back() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
