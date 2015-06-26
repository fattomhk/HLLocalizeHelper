# HLLocalizeHelper
Localization helper in swift. 

###If you want to set Locale to traditional Chinese:
`HLLocalizeHelper.setLanguage("zh-Hant");`

###Getting string from Localizable.strings:
`HLLocalizeHelper.localizedString("LOCALIZE_ME")`

###Getting string from Opps.strings:
`HLLocalizeHelper.localizedString("LOCALIZE_ME", stringFileName:"Opps")`

###Track Language is Set in viewcontroller
`NSNotificationCenter.defaultCenter().addObserver(self, selector: "updateViewToNewLanguage", name: HLLanguageDidSetKey, object: nil);`
