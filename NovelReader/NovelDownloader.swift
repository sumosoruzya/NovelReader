//
//  NovelDownloader.swift
//  NovelReader
//
//  Created by 鈴木雄太 on 2017/08/09.
//  Copyright © 2017年 sumo. All rights reserved.
//

import Foundation
import Alamofire
import Kanna

enum Kind {
    case hameln
    case narou
    case etc
}

class NovelDownloader {
    func download(_ url: URL) {
        var kind: Kind = .etc
        var url_true = url
        var urlString = url.absoluteString
        print(urlString)
        
        // どのサイトかと目次にいるか
        if urlString.contains("https://novel.syosetu.org/") {
            kind = .hameln
            do {
                let regex = try NSRegularExpression(pattern: "https://novel.syosetu.org/[0-9]+/")
                let matches = regex.matches(in: urlString, range: NSMakeRange(0, urlString.utf8.count))
                url_true = URL(string: (urlString as NSString).substring(with: matches[0].rangeAt(0)))!
            } catch {
                fatalError("（そんな正規表現）ないです。")
            }
        }
        
        // html取得
        var data: Data!
        do {
            data = try Data(contentsOf: url_true)
        } catch {
            fatalError("（そんなページ）ないです。")
        }
        let doc = HTML(html: data, encoding: .utf8)
        
        // 各サイトごとに処理を変更
        switch kind {
        case .hameln:
            hameln(doc)
        case .narou:
            narou(doc)
        case .etc:
            fatalError("（うちでは扱って）ないです。")
        }
    }
    
    func hameln(_ doc: HTMLDocument?){
        let ss = doc?.body?.css(".ss")
        let ss_count: Int = (ss?.count)!
        var title: XMLElement
        var preface: XMLElement
        var contents: XMLElement
        
        switch ss_count {
        case 2:
            title = (ss?.first)!
            preface = (ss?[1])!
            contents = (ss?[2])!
        case 4:
            title = (ss?[0])!
            preface = (ss?[1])!
            contents = (ss?[2])!
        default:
            fatalError("（ssクラスが）ないです。")
        }
        
        print(contents.innerHTML)
    }
    
    func narou(_ doc: HTMLDocument?){
        
    }
}
