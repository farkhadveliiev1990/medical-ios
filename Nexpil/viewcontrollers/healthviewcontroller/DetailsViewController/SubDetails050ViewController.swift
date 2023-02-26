//
//  SubDetails050ViewController.swift
//  Nexpil
//
//  Created by Loyal Lauzier on 2018/05/28.
//  Copyright © 2018 MobileDev. All rights reserved.
//

import UIKit
import SVProgressHUD

class SubDetails050ViewController: UIViewController,
    UITableViewDelegate,
    UITableViewDataSource
{

    @IBOutlet weak var tableList: UITableView!
    var arrayList = NSArray()
    var manager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.initMainView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        self.fetchWeight()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func initMainView() {
        tableList.delegate = self
        tableList.dataSource = self
    }
    
    // MARK - TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 590
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if arrayList.count == 0 {
            return 0
        } else {
            return arrayList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if arrayList.count > 0 {
            let dicList = arrayList[indexPath.row] as! NSDictionary
            
            tableView.register(UINib(nibName: "WeightWeekTableViewCell", bundle: nil), forCellReuseIdentifier: "WeightWeekTableViewCell")
            let cell = tableView.dequeueReusableCell(withIdentifier: "WeightWeekTableViewCell", for: indexPath) as! WeightWeekTableViewCell
            cell.selectionStyle = .none
            cell.setInfo(dic: dicList)
            
            return cell
        } else {
            return UITableViewCell.init()
        }
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.reloadRows(at: [indexPath], with: .none)
        
        if indexPath.row == 0 {
            sleep(UInt32(0.5))
            
        } else {
        }
        
    }

    // MARK - Fetch
    func fetchWeight() {
        SVProgressHUD.show()
        
        let array = manager.fetchWeightGetAllWeekData()

        SVProgressHUD.dismiss()
        if array.count > 0 {
            arrayList = array
        }
        
        tableList.reloadData()
        tableList.setContentOffset(.zero, animated: true)
        
    }
    
}
