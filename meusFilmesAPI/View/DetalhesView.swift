//
//  DetalhesView.swift
//  meusFilmesAPI
//
//  Created by Jean Ramalho on 28/02/25.
//
import Foundation
import UIKit

class DetalhesView: UIView {
    
    lazy var capaDetalhesFilme: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 12
        return image
    }()
    
    lazy var tituloDetalhesFilme: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 32)
        return label
    }()
    
    lazy var descricaoDetalhesFilme: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textColor = .darkGray
        label.textAlignment = .justified
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        addSubview(capaDetalhesFilme)
        addSubview(tituloDetalhesFilme)
        addSubview(descricaoDetalhesFilme)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            capaDetalhesFilme.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 12),
            capaDetalhesFilme.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            capaDetalhesFilme.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            capaDetalhesFilme.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6),
            
            tituloDetalhesFilme.topAnchor.constraint(equalTo: capaDetalhesFilme.bottomAnchor, constant: 12),
            tituloDetalhesFilme.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            tituloDetalhesFilme.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            descricaoDetalhesFilme.topAnchor.constraint(equalTo: tituloDetalhesFilme.bottomAnchor, constant: 12),
            descricaoDetalhesFilme.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descricaoDetalhesFilme.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        ])
    }
}
