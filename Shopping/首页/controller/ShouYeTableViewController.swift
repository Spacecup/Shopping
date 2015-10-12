//
//  ShouYeTableViewController.swift
//  Shopping
//
//  Created by mudy on 15/9/24.
//  Copyright (c) 2015年 mudy. All rights reserved.
//

import UIKit

class ShouYeTableViewController: UITableViewController,headViewDelegate,DPRequestDelegate,MBProgressHUDDelegate{
    lazy var dataSource = []
    var page = Int()
     var hud = MBProgressHUD()
    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationItem.leftBarButtonItem = setCitySelectedBtn()
        setNavTitleView()
        let header = NSBundle.mainBundle().loadNibNamed("headView", owner: self, options: nil).last as! headView
        self.tableView.tableHeaderView = header
        
        header.delegate = self
        
        requestData()
        //下拉刷新
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.tintColor = UIColor.redColor()
        self.refreshControl?.addTarget(self, action: "pullDownRefresh", forControlEvents: UIControlEvents.ValueChanged)
        
        //上拉加载
        //        self.tableView.add
       hud.delegate = self
        hud.backgroundColor = UIColor.redColor()
        self.view.addSubview(hud)
        
        print(musicList)
    }
    
    lazy var musicList: NSArray = {
//        return Cities.getCitys()
        return CityGroups.getCitys()
        }()
    
    
    //MARK:下拉刷新
    func pullDownRefresh(){
        self.refreshControl?.attributedTitle = NSAttributedString(string: "刷新ing")
        requestData()
        self.tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }
    
    
    //MARK:网络请求
    func requestData(){
        let dian = DPAPI()
//        hud.hidden = false
        hud.labelText = "正在加载"
        var params = ["city":"亳州"] as NSMutableDictionary
        dian.requestWithURL("v1/deal/find_deals", params: params, delegate: self)
    }
    
    
    //MARK:DPRequestDelegate
    func request(request: DPRequest!, didFailWithError error: NSError!) {
        print(error)
    }
    
    
    func request(request: DPRequest!, didFinishLoadingWithResult result: AnyObject!) {
        let direct = result as! NSDictionary
        var someThing = direct["deals"] as? NSArray
        dataSource = someThing!
        
        
//        print(someThing!)
        print(dataSource.count)
        self.tableView.reloadData()
//        hud.hidden = true
    }
    
    
    //MARK:headViewDelegate
    func clickedAtNum(clicked: Int) {
        //1.设置self.tabBarController.tabBar.hidden=YES;
        self.tabBarController!.tabBar.hidden = true
        //2.如果在push跳转时需要隐藏tabBar，设置self.hidesBottomBarWhenPushed=YES;
        self.hidesBottomBarWhenPushed = true
        let nextController = CategoryTableViewController()
        self.navigationController?.pushViewController(nextController, animated: true)
        self.hidesBottomBarWhenPushed = false;
        //并在push后设置self.hidesBottomBarWhenPushed=NO;
        //这样back回来的时候，tabBar会恢复正常显示。
        print("\(clicked)")
        
        switch clicked{
        case 1000:
            nextController.category = "1000"
        case 1001:
            nextController.category = "1001"
        case 1002:
            nextController.category = "1002"
        case 1003:
            nextController.category = "1003"
        case 1004:
            nextController.category = "1004"
        case 1005:
            nextController.category = "1005"
        case 1006:
            nextController.category = "1006"
        case 1007:
            nextController.category = "1007"
        
        default :
            nextController.category = "全部"
        }
        
        
        
    }
    
    
    //MARK:设置主页左上方选择城市的按钮
    func setCitySelectedBtn()->UIBarButtonItem{
        let cityBtn = UIButton.buttonWithType(UIButtonType.Custom) as! UIButton
        
        let imageV = UIImageView(image:UIImage(named: "首页_06.png")) as UIImageView
        imageV.frame = CGRectMake(30, 8, 12, 12)
        cityBtn.addSubview(imageV)
        
        let nameLabel = UILabel()
        nameLabel.text = "默认"
        nameLabel.font = UIFont.systemFontOfSize(15)
        nameLabel.frame = CGRectMake(0, 5, 50, 20)
        cityBtn.addSubview(nameLabel)
        
        cityBtn.frame = CGRectMake(0, 5, 54, 30)
        cityBtn.addTarget(self, action: "citySelectedBtn", forControlEvents: UIControlEvents.TouchUpInside)
        //当设置了左边的按钮自定义以后，titleview就不居中了
        let cityBtnItem = UIBarButtonItem(customView: cityBtn)
        
        return cityBtnItem
    }
    
    
    //设置主页左上方选择城市的按钮
    func citySelectedBtn() {
        print("你点击了城市选择的按钮\n")
        
        
    }
    
    
    //设置首页导航栏的中间的视图
    func setNavTitleView(){
        
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 35, height: 25))
        imageView.contentMode = .ScaleAspectFit
        let image = UIImage(named: "首页0_03.png")
        imageView.image = image
        
        navigationItem.titleView = imageView
    }
    
    
    
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = NSBundle.mainBundle().loadNibNamed("headView", owner: self, options: nil).last as! UIView
        
        return header
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = NSBundle.mainBundle().loadNibNamed("dealsViewCell", owner: self, options: nil).last as! dealsViewCell
        cell.data = dataSource[indexPath.row] as! NSDictionary
        return cell
        
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 120
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return NO if you do not want the item to be re-orderable.
    return true
    }
    */
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    }
    */
    
}
