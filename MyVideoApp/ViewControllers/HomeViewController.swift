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
    
    
    // MARK: - Actions
    
    
    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print("HELLO WORLD")
        viewModel.loadMovies {
            print("Movies display")
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
