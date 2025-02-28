//
//  DetalhesViewController.swift
//  meusFilmesAPI
//
//  Created by Jean Ramalho on 28/02/25.
//
import Foundation
import UIKit

class DetalhesViewController: UIViewController {
    
    let contentView: DetalhesView
    let filme: Movie
    
    init(contentView: DetalhesView, filme: Movie) {
        self.contentView = contentView
        self.filme = filme
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func setup(){
        
        setMovieDetail()
        setHierarchy()
        setConstraints()
    }
    
    private func setMovieDetail(){
        
    }
    
    private func setHierarchy(){
        
    }
    
    private func setConstraints(){
        
    }
}
