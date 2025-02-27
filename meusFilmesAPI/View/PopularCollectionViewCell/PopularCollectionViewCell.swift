//
//  PopularCollectionViewCell.swift
//  meusFilmesAPI
//
//  Created by Jean Ramalho on 27/02/25.
//
import Foundation
import UIKit

class PopularCollectionViewCell: UICollectionViewCell {
    
    lazy var capaFilmeImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 12
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var tituloFilmeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = .black
        label.numberOfLines = 0
        return label
    }()
    
    static let identifier: String = "PopularCollectionViewCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Função para configurar a célula com os dados do filme
    func configureCell(with movie: Movie){
        // Define o título do filme no label
        tituloFilmeLabel.text = movie.title
        // Configura uma imagem temporária para evitar imagens erradas ao reciclar células
        capaFilmeImageView.image = UIImage(systemName: "photo")
        
        // Verifica se há uma URL válida para o poster
        if let url = movie.posterURL {
            // Inicia uma tarefa para baixar a imagem de forma assíncrona
            URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                // Caso haja dados e seja possível criar uma UIImage
                if let data = data, let image = UIImage(data: data) {
                    // Atualiza a UI na thread principal
                    DispatchQueue.main.async {
                        self?.capaFilmeImageView.image = image
                    }
                    } else {
                        // Se ocorrer erro ou não houver dados, pode definir uma imagem padrão ou limpar a imagem
                        DispatchQueue.main.async {
                            self?.capaFilmeImageView.image = UIImage(systemName: "photo")
                        }
                    }
            }.resume() // Inicia a tarefa de rede
        } else {
            // Se a URL for inválida, define a imagem como nula ou uma imagem de placeholder
            capaFilmeImageView.image = UIImage(systemName: "photo")
        }
        }
    
    
    private func setupUI(){
        
        setHierarchy()
        setConstraints()
    }
    
    private func setHierarchy(){
        contentView.addSubview(capaFilmeImageView)
        contentView.addSubview(tituloFilmeLabel)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            capaFilmeImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 4),
            capaFilmeImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            capaFilmeImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
            capaFilmeImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -60),
            
            tituloFilmeLabel.topAnchor.constraint(equalTo: capaFilmeImageView.bottomAnchor, constant: 8),
            tituloFilmeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 4),
            tituloFilmeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -4),
        ])
    }
}
