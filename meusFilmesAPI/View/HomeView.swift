//
//  HomeView.swift
//  meusFilmesAPI
//
//  Created by Jean Ramalho on 27/02/25.
//
import Foundation
import UIKit

class HomeView: UIView {
    
    lazy var tituloLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 36)
        label.text = "Meus Filmes API".uppercased()
        label.textColor = .darkGray
        return label
    }()
    
    lazy var popularLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 28)
        label.text = "Mais Populares".uppercased()
        label.textColor = .black
        return label
    }()
    
    lazy var popularFilmesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.itemSize = CGSize(width: 200, height: 350)
        
        let colection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        colection.translatesAutoresizingMaskIntoConstraints = false
        colection.showsHorizontalScrollIndicator = false
        colection.backgroundColor = .blue
        return colection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        
        backgroundColor = .white
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        addSubview(tituloLabel)
        addSubview(popularLabel)
        addSubview(popularFilmesCollectionView)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            tituloLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            tituloLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            
            popularLabel.topAnchor.constraint(equalTo: tituloLabel.bottomAnchor, constant: 18),
            popularLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 18),
            
            popularFilmesCollectionView.topAnchor.constraint(equalTo: popularLabel.bottomAnchor, constant: 12),
            popularFilmesCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            popularFilmesCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            popularFilmesCollectionView.heightAnchor.constraint(equalToConstant: 350),
            
        ])
    }
}
