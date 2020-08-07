//
//  MovieViewController.swift
//  StarWars
//
//  Created by Fábio França on 05/08/20.
//  Copyright © 2020 music.com.chama. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController,PersonProtocol {

    @IBOutlet weak var titleMovieLabel: UILabel!
    @IBOutlet weak var episodeMovieLabel: UILabel!
    @IBOutlet weak var directorMovieLabel: UILabel!
    @IBOutlet weak var producerMovieLabel: UILabel!
    @IBOutlet weak var releasedMovieLabel: UILabel!
    @IBOutlet weak var crawlMovieLabel: UITextView!
    @IBOutlet weak var nextBtn: FadeEnabledBtn!
    @IBOutlet weak var previousBtn: FadeEnabledBtn!
    
    var person: Person!
    let api = MovieApi()
    var movies = [Movie]()
    var index = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        previousBtn.isEnabled = false
        nextBtn.isEnabled = false
        getMovie(url: person.movieUrls[index]) { (movie) in
            self.setupView(movie: movie)
            self.setIndex()
        }
    }
    
    func setupView(movie: Movie) {
        titleMovieLabel.text = movie.title
        episodeMovieLabel.text = "\(movie.title)"
        directorMovieLabel.text = movie.director
        producerMovieLabel.text = movie.producer
        releasedMovieLabel.text = movie.release
        crawlMovieLabel.text = movie.crawl
    }
    
    func setIndex() {
        self.previousBtn.isEnabled = index == 0 ? false : true
        self.nextBtn.isEnabled = index == (person.movieUrls.count - 1) ? false : true
        
        if(index > movies.count - 1) {
            getMovie(url: person.movieUrls[index]) { (movie) in
                self.setupView(movie: movie)
            }
        }else{
            self.setupView(movie: movies[index])
        }
    }
    
    func getMovie(url: String, completion: @escaping MovieResponseCompletion){
        api.getMovie(url: url) { (movie) in
            self.movies.append(movie)
            completion(movie)
            print("Nova Request")
        }
    }
    
    @IBAction func previousBtnClicked(_ sender: Any) {
        index -= 1
        setIndex()
    }
    
    @IBAction func nextBtnClicked(_ sender: Any) {
        index += 1
        setIndex()
    }
    
    

}
