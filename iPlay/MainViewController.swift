//
//  MainViewController.swift
//  iPlay
//
//  Created by mac_admin on 02/11/17.
//  Copyright © 2017 mac_admin. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let interest =  UserDefaults.standard.value(forKey: "interest") as! String
        let bounds = UIScreen.main.bounds
        let width = bounds.size.width
        let height = bounds.size.height
        if interest.caseInsensitiveCompare("songs") == ComparisonResult.orderedSame {
              let songsView = Bundle.main.loadNibNamed("SongsView", owner: self, options: nil)?.first as? SongsView
            songsView?.frame = CGRect(x: 0, y: 0, width: width, height: height)
                self.view.addSubview(view)
        }
        else if interest.caseInsensitiveCompare("photos") == ComparisonResult.orderedSame {
            let songsView = Bundle.main.loadNibNamed("SongsView", owner: self, options: nil)?.first as? SongsView
            songsView?.frame = CGRect(x: 0, y: 0, width: width, height: height)
            self.view.addSubview(view)
        }
        else if interest.caseInsensitiveCompare("videos") == ComparisonResult.orderedSame {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
