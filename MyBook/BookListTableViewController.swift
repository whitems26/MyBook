//
//  BookListTableViewController.swift
//  MyBook
//
//  Created by ktds 19 on 2017. 8. 17..
//  Copyright © 2017년 cjon. All rights reserved.
//

import UIKit

class BookListTableViewController: UITableViewController {

//    var books:[String] = ["Arsenal", "Tottenham", "Manchester United", "Chelsea", "Liverpool"]
    var books:[Book] = []
    
    var bookImgs:[String] = ["img1", "img2", "Manchester United", "Chelsea", "Liverpool"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        
        let book1 = Book(title: "원피스", writer: "Eiichiro Oda", publisher: "대원씨아이", coverImage: UIImage(named:"onepiece")!, descripter: "유쾌한 해적들의 신나는 모험 이야기를 그린 만화『원피스』시리즈 제55권. 본 작품은 대해적 시대, 전설의 해적왕 '골드 로저'가 남긴 '원피스'를 찾기 위해 모험을 떠나는 루피와 친구들의 이야기이다. 의지 하나로 모험을 떠나는 루피와 그에 못지 않은 친구들은, 한번 읽기 시작하면 손을 뗄 수 없게 만드는 캐릭터들이다.", price: 4500, url:"http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9791133442188&orderClick=LET&Kc=")
        
        
        let book2 = Book(title: "나루토", writer: "Masashi Kishimoto", publisher: "대원씨아이", coverImage: UIImage(named:"naruto")!, descripter: "닌자를 소재로 한 만화 『나루토』 제11권. '세 번째 시험' 본선을 앞두고 수수께끼의 에로 선인과 수업을 시작한 나루토! 한편 바로 그 시각, 가아라에 승부를 도전한 도스는 눈 깜짝할 사이에 무참히 당하고 만다. 그리고 이를 방관하는 카부토와 모래 마을 상급 닌자 바키! 누구도 상상 못했던 가공할 밀약이 바로 지금 밝혀진다!", price: 4500, url:"http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788925285061&orderClick=LET&Kc=")
    
        let book3 = Book(title: "드래곤볼", writer: "Akira Toriyama", publisher: "서울문화사", coverImage: UIImage(named:"dragonball")!, descripter: "Akira Toriyama의 만화 『드래곤 볼 완전판』 제2권. 만화계의 전설 《드래곤 볼》이 완전판으로 복간되었다. 드래곤 볼을 찾기 위한 손오공과 그 일행의 여행을 담았다. 일본 만화 붐을 일으킨 화제작.", price: 4500, url:"http://www.kyobobook.co.kr/product/detailViewKor.laf?ejkGb=KOR&mallGb=KOR&barcode=9788926363157&orderClick=LET&Kc=")
    
        books.append(book1)
        books.append(book2)
        books.append(book3)
        
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return books.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = books[indexPath.row].title
//        print("Cell Index : \(indexPath.row)")
        cell.detailTextLabel?.text = books[indexPath.row].writer
        
        cell.imageView?.image = books[indexPath.row].coverImage
        
        return cell
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
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        let cell = sender as?UITableViewCell
        
        
        let vc = segue.destination as? BookDetailViewController
        
        guard let selectedCell = cell, let detailVC = vc else {
            return
        }
        
        
        if let idx = self.tableView.indexPath(for: selectedCell) {
            detailVC.book = self.books[idx.row]
        }
        
//        if let selCell = cell {
//            let cellIdx = self.tableView.indexPath(for: selCell)
//            print(cellIdx?.row)
//        }

        
        
    }
 

}
