//
//  TableViewController.swift
//  UITableViewControllerPart2
//
//  Created by IwasakIYuta on 2021/07/05.
//

import UIKit

class TableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
//sectionsの数
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }
//rows（せる）の数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //sectionごとにセルの数を変えたいためにケースパターンを使ってみた
        if case section = 0 {
            return 5
        } else if case section = 1 {
            return 10
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //sectionを二つ用意するためにそれぞれのセクションCellのidentifierを設定
        var identifier = ""
        switch indexPath.section {
        case 0:
        identifier = "Cell1"
        case 1:
        identifier = "Cell2"
        default:
            print("error")
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)

        // Configure the cell...
        
        cell.textLabel?.text = "\(indexPath.row + 1)"
        return cell
    }
    //titleForHeaderに名前をつけるメソッド
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Sections\(section)"
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
   //indexPathForSelectedRowでラベルにどのセクションとセルがタップされてるから表示するように実装した
    @IBAction func checkSelectButton(_ sender: UIBarButtonItem) {
        if let selected = self.tableView.indexPathForSelectedRow {
            let lable1 = self.view.viewWithTag(1) as! UILabel
            let lable2 = self.view.viewWithTag(2) as! UILabel
            switch selected.section {
            case 0:
                lable1.text = "Sections\(selected.section)の\(selected.row + 1)が選ばれました"
            case 1:
                lable2.text = "Sections\(selected.section)の\(selected.row + 1)が選ばれました"
            default:
                return print("error")
            }
            //            lable1.text = "Sections\(selected.section)の\(selected.row + 1)が選ばれました"
//            lable2.text = "Sections\(selected.section)の\(selected.row + 1)が選ばれました"
        } else {
            print("選ばれていません")
        }
    }
    
}
