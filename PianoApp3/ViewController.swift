//
//  ViewController.swift
//  PianoApp3
//
//  Created by 大西穣 on 2023/10/23.
//
import UIKit
import AVFoundation

class ViewController: UIViewController {

    var audioPlayers: [AVAudioPlayer] = []
    var isPlaying: [Bool] = [false, false, false, false, false, false]

    
    // 白鍵のUIButton
    @IBOutlet weak var c3Button: UIButton!
    @IBOutlet weak var d3Button: UIButton!
    @IBOutlet weak var e3Button: UIButton!
    @IBOutlet weak var f3Button: UIButton!
    @IBOutlet weak var csharp3Button: UIButton!
    @IBOutlet weak var dsharp3Button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // サウンドファイルの名前を設定
        let soundFileNames = ["C3", "D3", "E3", "F3", "C#3", "D#3"]
        
        // サウンドファイルをAVAudioPlayerに読み込む
            for (index, soundFileName) in soundFileNames.enumerated() {
                if let soundURL = Bundle.main.url(forResource: soundFileName, withExtension: "mp3") {
                    do {
                        let audioPlayer = try AVAudioPlayer(contentsOf: soundURL)
                        audioPlayers.append(audioPlayer)
                        audioPlayer.prepareToPlay()
                        // ボタンのtagプロパティを設定
                        switch index {
                        case 0: c3Button.tag = index
                        case 1: d3Button.tag = index
                        case 2: e3Button.tag = index
                        case 3: f3Button.tag = index
                        case 4: csharp3Button.tag = index
                        case 5: dsharp3Button.tag = index
                        default: break
                        }
                    } catch {
                        print("Error loading sound file \(soundFileName)")
                    }
                }
            }
        
          // ボタンに黒い輪郭を追加
        c3Button.layer.borderColor = UIColor.black.cgColor
        c3Button.layer.borderWidth = 1.0
        c3Button.layer.cornerRadius = 10.0 // ここで角の丸みを設定

        d3Button.layer.borderColor = UIColor.black.cgColor
        d3Button.layer.borderWidth = 1.0
        d3Button.layer.cornerRadius = 10.0

        e3Button.layer.borderColor = UIColor.black.cgColor
        e3Button.layer.borderWidth = 1.0
        e3Button.layer.cornerRadius = 10.0
        
        f3Button.layer.borderColor = UIColor.black.cgColor
        f3Button.layer.borderWidth = 1.0
        f3Button.layer.cornerRadius = 10.0

        csharp3Button.layer.borderColor = UIColor.black.cgColor
        csharp3Button.layer.borderWidth = 1.0
        csharp3Button.layer.cornerRadius = 10.0

        dsharp3Button.layer.borderColor = UIColor.black.cgColor
        dsharp3Button.layer.borderWidth = 1.0
        dsharp3Button.layer.cornerRadius = 10.0
      }
        

        @IBAction func playSound(_ sender: UIButton) {
            let tag = sender.tag // ボタンのタグに対応するインデックス
            if tag >= 0 && tag < audioPlayers.count {
                audioPlayers[tag].play()
            }
        }


   func stopOldestSound() {
       var oldestIndex = -1
       for i in 0..<isPlaying.count {
           if isPlaying[i] {
               if oldestIndex == -1 {
                   oldestIndex = i
               } else if audioPlayers[i].currentTime > audioPlayers[oldestIndex].currentTime {
                   oldestIndex = i
               }
           }
       }
       if oldestIndex != -1 {
           audioPlayers[oldestIndex].stop()
           isPlaying[oldestIndex] = false
       }
   }


    // 白鍵のUIButtonが押されたときの処理
    @IBAction func whiteKeyPressed(_ sender: UIButton) {
        sender.backgroundColor = UIColor.gray // ボタンの背景色をグレーに変更
    }
    
    
    // 白鍵のUIButtonが離されたときの処理
    @IBAction func whiteKeyReleased(_ sender: UIButton) {
        sender.backgroundColor = UIColor.white // ボタンの背景色を元に戻す
    }

    // 黒鍵のUIButtonが押されたときの処理
    @IBAction func blackKeyPressed(_ sender: UIButton) {
        sender.backgroundColor = UIColor.darkGray // ボタンの背景色をダークグレーに変更
    }

    // 黒鍵のUIButtonが離されたときの処理
    @IBAction func blackKeyReleased(_ sender: UIButton) {
        sender.backgroundColor = UIColor.black // ボタンの背景色を元に戻す
    }
    }
