//
//  Movie.swift
//  FlixAssignment
//
//  Created by Marissa Bush on 12/9/17.
//  Copyright © 2017 Marissa Bush. All rights reserved.
//

import Foundation

class Movie {
    var title: String
    var overview: String
    var releaseDate: String
    var baseURLString: String
    var posterPathString: String
    var backdropPathString: String
    var backdropURL: URL
    var posterURL: URL
    
    class func movies(dictionaries: [[String:Any]]) -> [Movie] {
        var movies: [Movie] = [];
        for dict in dictionaries {
            let movie = Movie(dictionary: dict)
            movies.append(movie)
        }
        
        return movies
    }
    
    // Create an Initializer to initialize the properties defined above
    // Since the movie API is in the form of a dictionary, create an Initializer that accepts a dictionary parameter
    init(dictionary: [String:Any]) {
        title = dictionary["title"] as? String ?? "No Title";
        overview = dictionary["overview"] as? String ?? "No Description";
        releaseDate = dictionary["release_date"] as? String ?? "No Date";
        
        //Getting the poster and backdrop images
        baseURLString = "https://image.tmdb.org/t/p/w500";
        posterPathString = dictionary["poster_path"] as! String
        backdropPathString = dictionary["backdrop_path"] as! String
        posterURL = URL(string: baseURLString + posterPathString)!
        backdropURL = URL(string: baseURLString + backdropPathString)!
    }
}
