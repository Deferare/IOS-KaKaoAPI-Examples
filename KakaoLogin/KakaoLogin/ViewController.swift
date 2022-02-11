//
//  ViewController.swift
//  KakaoLogin
//
//  Created by Deforeturn on 2/11/22.
//

import UIKit
import KakaoSDKCommon
import KakaoSDKAuth
import KakaoSDKUser


class ViewController: UIViewController {
    @IBOutlet var result:UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func login(_ sender:UIButton){
//         카카오톡 앱으로 로그인.
//        if (UserApi.isKakaoTalkLoginAvailable()) {
//            UserApi.shared.loginWithKakaoTalk {(oauthToken, error) in
//                print("error: ", error)
//                if let error = error {
//                    print("error: ", error)
//                }
//                else {
//                    print("loginWithKakaoTalk() success.")
//
//                    //do something
//                    _ = oauthToken
//                }
//            }
//        }
        
//         카카오계정으로 로그인.
        UserApi.shared.loginWithKakaoAccount(prompts:[.Login]) {(oauthToken, error) in
            if let error = error {
                print("error: ", error)
                self.result.text = "Fail"
            }
            else {
                self.result.text = "Success"
                
                //사용자 정보 가져오기.
                let token = oauthToken
                print("token: ", token)
                UserApi.shared.me() {(user, error) in
                    if let error = error {
                        print(error)
                    }
                    else {
                        
                        //do something
                        print("user: ", user)
                    }
                }
            }
        }
    }
}

