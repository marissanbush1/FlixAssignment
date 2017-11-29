//
//  DetailViewController.swift
//  FlixAssignment
//
//  Created by Marissa Bush on 11/25/17.
//  Copyright © 2017 Marissa Bush. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var posterImage: UIImageView!
    @IBOutlet weak var backdropImage: UIImageView!
    var movie: [String: Any]?
    override func viewDidLoad() {
        super.viewDidLoad()
        if let movie = movie{
            titleLabel.text = movie["title"] as? String
            releaseDateLabel.text = movie["release_date"] as? String
            overviewLabel.text = movie["overview"] as? String
            let backdropPath = movie["backdrop_path"] as! String
            let posterPath = movie["poster_path"] as! String
            let baseURLString = "https://image.tmdb.org/t/p/w500"
            let backdropURL = URL(string: baseURLString + backdropPath)!
            backdropImage.af_setImage(withURL: backdropURL)
            let posterURL = URL(string: baseURLString + posterPath)!
            posterImage.af_setImage(withURL: posterURL)
            
        }
        
        
        // Do any additional setup after loading the view.
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
