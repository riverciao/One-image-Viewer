//
//  SelectPhotoTableViewController.swift
//  One-image Viewer
//
//  Created by riverciao on 2017/11/23.
//  Copyright © 2017年 riverciao. All rights reserved.
//

import UIKit

class SelectPhotoTableViewController: UITableViewController {


    @IBOutlet var selectPhotoCollectionView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(Photo.count)")

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Self-sizing Table View Cells
        self.tableView.estimatedRowHeight = 86.0
        self.tableView.rowHeight = UITableViewAutomaticDimension
        
        
    }


    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Photo.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var photoCell = SelectPhotoTableViewCell()
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "photoCell") as? SelectPhotoTableViewCell {
        
//            cell.cellPhotoImageView = UIImageView(image: Photo.baseball.photoImage)
            
            if let baseballImage = UIImage(named: "img_baseball") {
                cell.cellPhotoImageView = UIImageView(image: baseballImage)
            } else {
            }
    //        cellPhotoImageView.frame = CGRect(x: 8, y: 8, width: 60, height: 60)
    //        cell.contentView.addSubview(cellPhotoImageView)
        
            photoCell = cell
        }
        return photoCell
    }
//    
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200.0
//    }
//    override open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 200.0
//    }

}
