//
//  SongsTableViewCell.swift
//  iPlay
//
//  Created by mac_admin on 02/11/17.
//  Copyright © 2017 mac_admin. All rights reserved.
//

import UIKit
protocol SongsCellDelegate {
    func pauseTapped(_ cell: SongsTableViewCell)
    func resumeTapped(_ cell: SongsTableViewCell)
    func cancelTapped(_ cell: SongsTableViewCell)
    func downloadTapped(_ cell: SongsTableViewCell)
}
class SongsTableViewCell: UITableViewCell {
    @IBOutlet var songName: UILabel!
    @IBOutlet var pauseButton: UIButton!
    @IBOutlet var downloadButton: UIButton!
    @IBOutlet var cancelButton: UIButton!
    @IBOutlet var artistName: UILabel!
    var delegate : SongsCellDelegate?
    
    @IBAction func downloadAction(_ sender: Any) {
        delegate?.downloadTapped(self)
    }
    @IBAction func pauseOrResumeAction(_ sender: Any) {
        if pauseButton.titleLabel?.text! == "Pause" {
            delegate?.pauseTapped(self)
        }else
        {
            delegate?.resumeTapped(self)
        }
    }
    
    @IBAction func cancelAction(_ sender: Any) {
        delegate?.cancelTapped(self)
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
