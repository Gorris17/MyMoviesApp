//
//  HomeViewController.swift
//  MyVideoApp
//
//  Created by Fernando Corral on 11/3/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    // MARK: - Properties
    let viewModel = HomeViewModel()
    
    // MARK: - Outlets
    
    @IBOutlet weak var moviesSearchBar: UISearchBar!
    @IBOutlet weak var moviesTitleLabel: UILabel!
    @IBOutlet weak var moviesTableView: UITableView!
    
    // MARK: - Actions
    
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Register cells
        moviesSearchBar.delegate = self
        moviesTableView.register(UINib.init(nibName: "MovieTableViewCell", bundle: nil), forCellReuseIdentifier: "movieCell")
        moviesTableView.dataSource = self
        moviesTableView.delegate = self
        
        viewModel.loadMovies {
            self.moviesTableView.reloadData()
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: - UITableViewDelegate & UITableViewDataSource
extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.moviesList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = moviesTableView.dequeueReusableCell(withIdentifier: "movieCell") as? MovieTableViewCell {
            let movie = viewModel.moviesList[indexPath.row]
            if let movieImage = viewModel.loadMovieImage(movie: movie, imageType: .vertical) {
                cell.configureCell(movie: movie, image: movieImage)
                return cell
            }
            return UITableViewCell()
            
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "DetailMovie", bundle: nil)
        if let detailVC = storyboard.instantiateViewController(withIdentifier: "detailsMovie") as? DetailMovieViewController {
            detailVC.viewModel = self.viewModel
            detailVC.movie = viewModel.moviesList[indexPath.row]
            
            navigationController?.pushViewController(detailVC, animated: true)
        }
        tableView.deselectRow(at: indexPath, animated: false)
    }
}


// MARK: - UISearchBarDelegate
extension HomeViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
