//
//  HomeViewController.swift
//  meusFilmesAPI
//
//  Created by Jean Ramalho on 27/02/25.
//
import Foundation
import UIKit

class HomeViewController: UIViewController {
    
    let contentView: HomeView
    
    private let movieService = MovieService()
    private var movies: [Movie] = []
    
    init(contentView: HomeView) {
        self.contentView = contentView
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
        
        contentView.popularFilmesCollectionView.delegate = self
        contentView.popularFilmesCollectionView.dataSource = self
        contentView.popularFilmesCollectionView.register(PopularCollectionViewCell.self, forCellWithReuseIdentifier: PopularCollectionViewCell.identifier)
        
        fetchMovies()
        setHierarchy()
        setConstraints()
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
    
    private func fetchMovies() {
          movieService.fetchMovies { [weak self] result in
              DispatchQueue.main.async {
                  switch result {
                  case .success(let movies):
                      self?.movies = movies
                      self?.contentView.popularFilmesCollectionView.reloadData()
                  case .failure(let error):
                      print("Erro ao buscar filmes: \(error.localizedDescription)")
                  }
              }
          }
      }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PopularCollectionViewCell.identifier, for: indexPath) as? PopularCollectionViewCell else {return UICollectionViewCell()}
        cell.configureCell(with: movies[indexPath.row])
        return cell
    }
    
    
}
