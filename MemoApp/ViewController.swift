//
//  ViewController.swift
//  MemoApp
//
//  Created by Ryo Motoki on 2017/10/31.
//  Copyright © 2017年 RyoMotoki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource ,UITableViewDelegate {
    
    var memoTitleArray = [[String]]()
    var memoArray = [String]()
    var sectionTitleArray = ["就活", "勉強", "遊び"]
    @IBOutlet var memoTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        memoTableView.dataSource = self
        memoTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        loadMemo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sectionTitleArray.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memoTitleArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleCell")!
        //cell.textLabel?.text = memoArray[indexPath.row]
        cell.textLabel?.text = memoTitleArray[indexPath.row][0]
        return cell
    }
    
    func loadMemo() {
        let ud = UserDefaults.standard
        if ud.array(forKey: "memoAllArray") != nil {
            memoTitleArray = ud.array(forKey: "memoAllArray") as! [[String]]
            //memoArray = ud.array(forKey: "memoArray") as! [String]
            memoTableView.reloadData()
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitleArray[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "toDetail", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "toDetail" {
            let detailViewController = segue.destination as! DetailViewController
            let selectedIndexPath = memoTableView.indexPathForSelectedRow!
            detailViewController.selectedMemo = memoTitleArray[selectedIndexPath.row]
            //detailViewController.selectedMemo = memoArray[selectedIndexPath.row]
            detailViewController.selectedRow = selectedIndexPath.row
        }
        
    }

}

