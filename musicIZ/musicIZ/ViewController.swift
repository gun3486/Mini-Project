//
//  ViewController.swift
//  MusicIZ
//
//  Created by GSM04 on 2021/07/10.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var table: UITableView!
    
    var songs = [Song]()
    
    override func viewDidLoad() {
        
        configureSongs()
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func configureSongs() {
        
        songs.append(Song(name: "FIESTA",
                          albumName: "BLOOM*IZ ",
                          artistName: "아이즈원(IZ*ONE)",
                          imageName: "cover1",
                          trackName: "song1"))
        
        songs.append(Song(name: "환상동화",
                          albumName: "Oneiric Diary (幻想日記)",
                          artistName: "아이즈원(IZ*ONE)",
                          imageName: "cover2",
                          trackName: "song2"))
        
        songs.append(Song(name: "Panorama",
                          albumName: "One-reeler / Act IV",
                          artistName: "아이즈원(IZ*ONE)",
                          imageName: "cover3",
                          trackName: "song3"))
        songs.append(Song(name: "FIESTA",
                          albumName: "BLOOM*IZ ",
                          artistName: "아이즈원(IZ*ONE)",
                          imageName: "cover1",
                          trackName: "song1"))
        
        songs.append(Song(name: "환상동화",
                          albumName: "Oneiric Diary (幻想日記)",
                          artistName: "아이즈원(IZ*ONE)",
                          imageName: "cover2",
                          trackName: "song2"))
        
        songs.append(Song(name: "Panorama",
                          albumName: "One-reeler / Act IV",
                          artistName: "아이즈원(IZ*ONE)",
                          imageName: "cover3",
                          trackName: "song3"))
        songs.append(Song(name: "FIESTA",
                          albumName: "BLOOM*IZ ",
                          artistName: "아이즈원(IZ*ONE)",
                          imageName: "cover1",
                          trackName: "song1"))
        
        songs.append(Song(name: "환상동화",
                          albumName: "Oneiric Diary (幻想日記)",
                          artistName: "아이즈원(IZ*ONE)",
                          imageName: "cover2",
                          trackName: "song2"))
        
        songs.append(Song(name: "Panorama",
                          albumName: "One-reeler / Act IV",
                          artistName: "아이즈원(IZ*ONE)",
                          imageName: "cover3",
                          trackName: "song3"))
        
    }
    
    //table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let song = songs[indexPath.row]
        
        cell.textLabel?.text = song.name
        cell.detailTextLabel?.text = song.albumName
        cell.accessoryType = .disclosureIndicator
        cell.imageView?.image = UIImage(named: song.imageName)
        cell.textLabel?.font = UIFont(name: "Helvetica-Bold", size: 18)
        cell.detailTextLabel?.font = UIFont(name: "Helvetica", size: 17)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let position = indexPath.row
        guard let vc = storyboard?.instantiateViewController(identifier: "player") as? PlayerViewController else {
            return
        }
        vc.songs = songs
        vc.position = position
        present(vc, animated: true)
    }
}

struct Song {
    let name: String
    let albumName: String
    let artistName: String
    let imageName: String
    let trackName: String
}

