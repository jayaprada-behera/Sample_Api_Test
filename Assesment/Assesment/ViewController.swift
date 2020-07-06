//
//  ViewController.swift
//  Assesment
//
//  Created by Jayaprada on 06/07/20.
//  Copyright © 2020  . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let API_KEY = "jvmNAyPNr1JhiCeUlYmB2ae517p3Th0aGG6syqMb"
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var calendarBtn: UIButton!
    @IBOutlet weak var searchBtn: UIButton!
    @IBOutlet weak var videoColView: UICollectionView!
    var videoCellDataSource = VideoCellDataSource()
    var videoModels : [VideoModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCell()
        videoColView.delegate = self
        videoColView.dataSource = videoCellDataSource
        fetchVideoSummary { [weak self] (videos) in
            self?.videoModels = videos
            self?.reloadCollectionData()
        }
        calendarBtn.setCornerRadiusAndShadow()
        searchBtn.setCornerRadiusAndShadow()
        // Do any additional setup after loading the view.
    }
     
    func registerCell(){
        videoColView.register(UINib(nibName: "\(VideoColViewCell.self)", bundle: Bundle.main), forCellWithReuseIdentifier: "cellIdentifier")
        
    }
    func reloadCollectionData() {

        videoCellDataSource.videoModels = self.videoModels
        DispatchQueue.main.async { [weak self] in
            guard let weakSelf = self else {return}
            weakSelf.videoColView.reloadData()
            self?.activityIndicator.stopAnimating()

        }
        
    }
    
    func fetchVideoSummary(completionHandler: @escaping ([VideoModel]) -> Void) {
        if NetworkManager.sharedInstance.isNetworkAvailable || NetworkManager.sharedInstance.reachabilityStatus == .Unknown {
            
            let url = URL(string: "https://qgkpjarwfl.execute-api.us-east-1.amazonaws.com/dev/getNormalVideoFiles?offset=0&limit=6")!
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "GET"
            urlRequest.setValue(API_KEY, forHTTPHeaderField: "x-api-key")
            
            
            let sharedSession = URLSession.shared
            urlRequest.timeoutInterval = 120
            
            let task = sharedSession.dataTask(with: urlRequest, completionHandler: { (dataRes, response, error) in
                if let error = error {
                    print("Error with fetching VideoFiles: \(error)")
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse,
                    (200...299).contains(httpResponse.statusCode) else {
                        print("Error with the response, unexpected status code: \(response)")
                        return
                }
                
                if let data = dataRes,
                    let videoSummary = try? JSONDecoder().decode([VideoModel].self, from: data) {
                    completionHandler(videoSummary)
                }
            })
            task.resume()
        }
        else{
            activityIndicator.stopAnimating()

            print("No Network")
            let alert = UIAlertController(title: "Alert", message: "No Network", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            
        }
    }
}
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.size.width/2 - 20, height: 170)
    }
 
}
