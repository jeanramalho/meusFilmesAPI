//
//  MovieService.swift
//  meusFilmesAPI
//
//  Created by Jean Ramalho on 27/02/25.
//
import Foundation

class MovieService {
    // URL base para filmes populares
    private let baseURL = "https://api.themoviedb.org/3/movie/popular"
    
    // Seu Bearer token (copie exatamente como fornecido pela API)
    private let bearerToken = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlYTE2MDEwNzAzZDJjODAwMDdhYTZmYWE5Mzk4NjU1OCIsIm5iZiI6MTY4MTMzMTc1Ny44MTksInN1YiI6IjY0MzcxNjJkOWFjNTM1MDEyOWI0NmE4MCIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.SADNQvjyOFDEWEQvLym2N6Ws9FyKu9yzlisKF3m_Ics"
    
    // Função para buscar os filmes usando URLSession
    func fetchMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        // Cria a URL base
        guard let url = URL(string: baseURL) else {
            completion(.failure(NSError(domain: "URL inválida", code: 400, userInfo: nil)))
            return
        }
        
        // Cria componentes da URL para adicionar parâmetros de consulta
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)!
        // Define os parâmetros: idioma e página
        let queryItems: [URLQueryItem] = [
            URLQueryItem(name: "language", value: "pt-BR"),
            URLQueryItem(name: "page", value: "1")
        ]
        // Se já houver queryItems, os adiciona; caso contrário, define diretamente
        if let existingItems = components.queryItems {
            components.queryItems = existingItems + queryItems
        } else {
            components.queryItems = queryItems
        }
        
        // Cria o URLRequest com a URL completa
        guard let requestURL = components.url else {
            completion(.failure(NSError(domain: "URL de requisição inválida", code: 400, userInfo: nil)))
            return
        }
        var request = URLRequest(url: requestURL)
        request.httpMethod = "GET"
        request.timeoutInterval = 10
        
        // Define os cabeçalhos da requisição, incluindo o Authorization com Bearer Token
        request.allHTTPHeaderFields = [
            "accept": "application/json",
            "Authorization": "Bearer \(bearerToken)"
        ]
        
        // Inicia a tarefa de rede com URLSession
        URLSession.shared.dataTask(with: request) { data, response, error in
            // Se ocorrer um erro, retorna com falha
            if let error = error {
                completion(.failure(error))
                return
            }
            
            // Verifica se os dados foram recebidos
            guard let data = data else {
                completion(.failure(NSError(domain: "Dados não encontrados", code: 404, userInfo: nil)))
                return
            }
            
            do {
                // Decodifica os dados recebidos para MovieResponse
                let decodedResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
                // Retorna a lista de filmes através do completion handler
                completion(.success(decodedResponse.results))
            } catch {
                // Caso ocorra erro na decodificação, retorna com falha
                completion(.failure(error))
            }
        }.resume() // Inicia a requisição
    }
}
