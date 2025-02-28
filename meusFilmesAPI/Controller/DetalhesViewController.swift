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
        setup()
    }
    
    private func setup(){
        
        setMovieDetail()
        setHierarchy()
        setConstraints()
    }
    
    private func setMovieDetail(){
        contentView.tituloDetalhesFilme.text = filme.title
        contentView.descricaoDetalhesFilme.text = filme.overview
        contentView.capaDetalhesFilme.image = UIImage(systemName: "photo")
        
        if let url = filme.posterURL {
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                if let data = data, let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.contentView.capaDetalhesFilme.image = image
                    }
                } else {
                    DispatchQueue.main.async {
                        self?.contentView.capaDetalhesFilme.image = UIImage(systemName: "photo")
                    }
                }
            } .resume()
                
        } else {
            contentView.capaDetalhesFilme.image = UIImage(systemName: "photo")
        }
        }
        
    
    
    private func setHierarchy(){
        view.addSubview(contentView)
    }
    
    private func setConstraints(){
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: view.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
}
