//
//  PlayerViewController.swift
//  MusicIZ
//
//  Created by GSM04 on 2021/07/12.
//


import AVFoundation
import UIKit

class PlayerViewController: UIViewController {
    
    public var position: Int = 0
    public var songs: [Song] = []
    
    @IBOutlet var holder: UIView!
    
    var player: AVAudioPlayer?
    
    private let albumImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let songNameLable : UILabel  = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let artistNameLable : UILabel  = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    private let albumNameLable : UILabel  = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        if holder.subviews.count == 0 {
            configure()
        }
    }
    
    func configure() {
        //set up player
        let song = songs[position]
        
        let urlString = Bundle.main.path(forResource: song.trackName, ofType: "mp3")
        
        do {
            try AVAudioSession.sharedInstance().setMode(.default)
            try AVAudioSession.sharedInstance().setActive(true, options: .notifyOthersOnDeactivation)
            
            guard let urlString = urlString else {
                return
            }
            
            player = try AVAudioPlayer(contentsOf: URL(string: urlString)!)
            
            guard let player = player else {
                return
            }
            player.play()
        }
        catch {
             print("error occurred")
        }
        
        albumImageView.frame = CGRect(x: 10,
                                      y: 10,
                                      width: holder.frame.size.width-20,
                                      height: holder.frame.size.width-20)
        albumImageView.image = UIImage(named: song.imageName)
        holder.addSubview(albumImageView)
         
        songNameLable.frame = CGRect(x: 10,
                                     y: albumImageView.frame.size.height + 10,
                                      width: holder.frame.size.width-20,
                                      height: 70)
        
        albumNameLable.frame = CGRect(x: 10,
                                      y: albumImageView.frame.size.height + 10 + 70,
                                      width: holder.frame.size.width-20,
                                      height: 70)
         
        artistNameLable.frame = CGRect(x: 10,
                                      y: albumImageView.frame.size.height + 10 + 140,
                                      width: holder.frame.size.width-20,
                                      height: 70)


        songNameLable.text = song.name
        albumNameLable.text = song.albumName
        artistNameLable.text = song.artistName
        
        //Labels
        holder.addSubview(songNameLable)
        holder.addSubview(albumNameLable)
        holder.addSubview(artistNameLable)
        //Player controls
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let player = player {
            player.stop()
        }
    }
    
}
