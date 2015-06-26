//
//  ViewController.swift
//  InAppLocalize
//
//  Created by Horst Leung on 26/6/15.
//  Copyright (c) 2015 Horst Leung. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblToLocalized: UILabel!
    @IBOutlet weak var btnChangeLanguage: UIButton!
    var isChinese: Bool = false;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        println(HLLocalizeHelper.getSystemLanguage());
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateViewToNewLanguage", name: HLLanguageDidSetKey, object: nil);
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        self.updateViewToNewLanguage();
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateViewToNewLanguage()
    {
        self.lblToLocalized.text = HLLocalizeHelper.localizedString("LOCALIZE_ME", stringFileName:"Opps");
        self.btnChangeLanguage.setTitle(HLLocalizeHelper.localizedString("CHANGE_LANGUAGE", stringFileName:"Opps"), forState: UIControlState.Normal);
    }
    
    @IBAction func toggleLanguage(sender: AnyObject)
    {
        if(!isChinese){
            HLLocalizeHelper.setLanguage("zh-Hant");
            isChinese = true;
        } else {
            HLLocalizeHelper.setLanguage("en");
            isChinese = false;
        }
    }
    


}

