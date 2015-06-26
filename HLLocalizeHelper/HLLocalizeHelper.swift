//
//  HLLocalizeHelper.swift
//
//  Created by Horst Leung on 26/6/15.
//  Copyright (c) 2015 Horst Leung. All rights reserved.
//  Version 0.1

import UIKit

let HLLanguageDidSetKey: String = "hk.com.vdelegate.LanguageDidChange"
let HLKeyForSavingLocale: String = "DEFAULTS_KEY_LANGUAGE_CODE";

class HLLocalizeHelper: NSObject
{
    class var sharedInstance: HLLocalizeHelper {
        struct Static {
            static var instance: HLLocalizeHelper?;
            static var token: dispatch_once_t = 0;
        }
        dispatch_once(&Static.token) {
            Static.instance = HLLocalizeHelper();
        }
        return Static.instance!;
    }
    
    //MARK: Class Functions
    class func getSystemLanguage()->String
    {
        return NSLocale.currentLocale().localeIdentifier;
    }
    
    class func localizedString(key: NSString, stringFileName: String? = nil)->String
    {
        return HLLocalizeHelper.sharedInstance.localizedString(key, stringFileName: stringFileName);
    }
    
    class func setLanguage(languageCode: String)
    {
        println("Language becomes: \(languageCode)");
        NSUserDefaults.standardUserDefaults().setObject(languageCode, forKey: HLKeyForSavingLocale);
        NSNotificationCenter.defaultCenter().postNotificationName(HLLanguageDidSetKey, object: self);
    }

    
    //MARK: Private Functions
    private func localizedString(key: NSString, stringFileName: String? = nil)->String
    {
        var languageCode =  NSUserDefaults.standardUserDefaults().stringForKey(HLKeyForSavingLocale);
        if(languageCode == nil){
            languageCode = HLLocalizeHelper.getSystemLanguage();
        }
        var Languagebundle = NSBundle.mainBundle(); //if language is not support, use the main one.
        
        // Get language bundle in the locale.
        let bundlePath = NSBundle.mainBundle().pathForResource(languageCode as String?, ofType: "lproj");
        if(bundlePath != nil){
            Languagebundle = NSBundle(path: bundlePath!)!;
        }
        
        // Get the translated string using the language bundle.
        let translatedString = Languagebundle.localizedStringForKey(key as String, value:"", table: stringFileName);
        
        return translatedString;
    }
    
    
}