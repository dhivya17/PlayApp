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
    var searchResults = [Song]()
    func setUpView()   {
        tableView.register(UINib.init(nibName: "SongsTableViewCell", bundle: nil), forCellReuseIdentifier: "songCell")
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
        //return searchResults.count
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "songCell", for: indexPath) as! SongsTableViewCell
        cell.songName.text = "Helo"
        cell.artistName.text = "DS"
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
   
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        //
//    }
    
}
extension SongsView : SongsCellDelegate{
    func pauseTapped(_ cell: SongsTableViewCell) {
        if let indexPath = tableView.indexPath(for: cell){
            let song = searchResults[indexPath.row]
           // pauseDownload(song)
            tableView.reloadRows(at: [IndexPath(row: indexPath.row, section: 0)], with: .none)
        }
    }
    
    func resumeTapped(_ cell: SongsTableViewCell) {
        if let indexPath = tableView.indexPath(for: cell){
            let song = searchResults[indexPath.row]
            //  resumeDownload(song)
            tableView.reloadRows(at: [IndexPath(row : indexPath.row, section:0)], with: .none)
        }
    }
    
    func cancelTapped(_ cell: SongsTableViewCell) {
        if let indexPath = tableView.indexPath(for: cell){
            let song = searchResults[indexPath.row]
           // cancelDownload(song)
            tableView.reloadRows(at: [IndexPath(row : indexPath.row, section:0)], with: .none)
        }
    }
    
    func downloadTapped(_ cell: SongsTableViewCell) {
        if let indexPath = tableView.indexPath(for: cell){
            let song = searchResults[indexPath.row]
           // startDownload(song)
            tableView.reloadRows(at: [IndexPath(row : indexPath.row, section:0)], with: .none)
        }
    }
    
    
    
}
