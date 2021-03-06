//
//  ViewController.swift
//  web
//
//  Created by 장진웅 on 2022/06/07.
//

import UIKit
import WebKit

//var images = ["NoBackGound120@4x.png"]


class ViewController: UIViewController, WKNavigationDelegate {

    var imgLogo : UIImage? //Logo 이미지가 있는 UIImage타입의 변수
    
    @IBOutlet var LogoImgView: UIImageView!
    //    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var myActivityIndicator: UIActivityIndicatorView!
    
    //특정 웹 페이지를 보여주기 위해 웹 페이지를 로드하는 함수
    func loadWebPage(_ url: String){ //String형 url을 이용하여 웹 페이지 나타냄
        let myUrl = URL(string: url) // url 값을 받아 URL형으로 선언함
        let myRequest = URLRequest(url: myUrl!) // 상수 myUrl을 받아 URLRequest형을 선언함
        myWebView.load(myRequest) //myWebView 클래스의 load메서드를 호출
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       // imgLogo = UIImage(named: "NoBackGound120@4x.png") // 되나?
        
      //  LogoImgView.image = imgLogo
        
        myWebView.navigationDelegate = self
        loadWebPage("https://huskycat1202.github.io/clothes/index.html")
    }
    
    //myWebView가 로딩 중일 때 인디케이터를 실행하고 화면에 나타나게함.
    func webView(_ webView: WKWebView, didCommit navigation : WKNavigation!) {
        myActivityIndicator.startAnimating()
        myActivityIndicator.isHidden = false
    }
    //로딩 완료되었을 때 동작하므로 인디케이터를 중지하고 숨김.
    func webView(_ webView: WKWebView, didFinish navigation : WKNavigation!) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }
    //로딩 실패시 동작하므로 역시 인디케이터는 중지하고 숨김.
    func webView(_ webView: WKWebView, didFail navigation : WKNavigation!, withError error: Error) {
        myActivityIndicator.stopAnimating()
        myActivityIndicator.isHidden = true
    }

//    @IBAction func btnGotoUrl(_ sender: UIButton) {
//
//    }
    
//    @IBAction func btnGoSite1(_ sender: UIButton) {
//    }
//    @IBAction func btnGoSite2(_ sender: UIButton) {
//    }
//    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
//    }
//    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
//    }
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading() // 웹 페이지의 로딩을 중지시키는 함수를 호출
    }
    @IBAction func btnReload(_ sender: UIBarButtonItem) {
        myWebView.reload() //웹 페이지의 로딩을 중지시키는 함수를 호출
    }
    @IBAction func btnGoBack(_ sender: UIBarButtonItem) {
        myWebView.goBack() // 이전 웹 페이지로 이동시키는 함수를 호출
    }
    @IBAction func btnGoForward(_ sender: UIBarButtonItem) {
        myWebView.goForward() //다음 웹 페이지로 이동시키는 함수를 호출
    }
    
}

