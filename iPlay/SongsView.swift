//
//  SongsView.swift
//  iPlay
//
//  Created by mac_admin on 02/11/17.
//  Copyright © 2017 mac_admin. All rights reserved.
//

import UIKit

class SongsView: UIView {
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    func setUpView()   {
        tableView.register(UINib.init(nibName: "SongsTableViewCell", bundle: nil), forCellReuseIdentifier: "SongCell")
    }
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
extension SongsView : UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! SongsTableViewCell
        cell.songName.text = "Helo"
        cell.artistName.text = "DS"
        return cell
    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //
//    }
    
}
