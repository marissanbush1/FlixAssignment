//
//  NowPlayingViewController.swift
//  FlixAssignment
//
//  Created by Marissa Bush on 11/17/17.
//  Copyright © 2017 Marissa Bush. All rights reserved.
//

import UIKit
import AlamofireImage

class NowPlayingViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var movieTableView: UITableView!
    
    var movies: [Movie] = []

    var refreshControl: UIRefreshControl!
    
    override func viewDidLoad() {
        activityIndicator.startAnimating()
        super.viewDidLoad()
        activityIndicator.stopAnimating()

        refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector (NowPlayingViewController.didPullToRefresh(_:)), for: .valueChanged)
        movieTableView.insertSubview(refreshControl, at: 0)
        
        movieTableView.dataSource = self
        movieTableView.delegate = self
        movieTableView.rowHeight = 200
        fetchMovies()

        
    }
    
    @objc func didPullToRefresh(_ refreshControl: UIRefreshControl){
        fetchMovies()
        
    }
    
    func fetchMovies(){
        MovieApiManager().nowPlayingMovies { (movies, error) in
            if let movies = movies {
                self.movies = movies
                self.movieTableView.reloadData()
                self.refreshControl.endRefreshing()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = movieTableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as! MovieCell
        let movie = movies[indexPath.row]
        let title = movie.title
        let overview = movie.overview
        cell.titleLabel.text = title
        cell.overviewLabel.text = overview
        
        
        cell.coverImage.af_setImage(withURL: movie.posterURL)
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! DetailViewController
        
        //Cast the sender as what is sending information
        //In this case, it's the selected cell
        let cell = sender as! UITableViewCell
        
        //get the indexpath for the cell selected
        if let indexPath = movieTableView.indexPath(for: cell) {
            //get the movie that is being sent
            let movie = movies[indexPath.row]
            //Send the selected Movie to the detail VC
            destination.movie = movie

        }
    }

}
