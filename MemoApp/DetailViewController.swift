//
//  DetailViewController.swift
//  MemoApp
//
//  Created by Ryo Motoki on 2017/11/01.
//  Copyright © 2017年 RyoMotoki. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    var selectedRow: Int!
    
    var selectedMemo = [String]()
    
    @IBOutlet var memoTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = selectedMemo[0]
        memoTextView.text = selectedMemo[1]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteMemo() {
        let ud = UserDefaults.standard
        if ud.array(forKey: "memoAllArray") != nil {
            var savedMemoArray = ud.array(forKey: "memoAllArray") as! [[String]]
            savedMemoArray.remove(at: selectedRow)
            ud.set(savedMemoArray, forKey: "memoAllArray")
            ud.synchronize()
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}
