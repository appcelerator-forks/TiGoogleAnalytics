# TiGoogleAnalytics

## What's this?

Google Analytics for iOS SDK3.xをベースにしたTitanium 用のネイティブモジュールです。まだ不完全で実機だと一部処理実行すると落ちてしまう不具合あるのですが、今後もメンテしていく予定なのでひとまず公開だけしました

## 利用方法

```javascript
var GoogleAnalytics = require('info.h5y1m141.TiGoogleAnalytics');
GoogleAnalytics.initTracker('UA-XXXXXX-1');

var win = Ti.UI.createWindow({
	backgroundColor: '#fff'
});

var obj = {
  reportData:"GoogleAnalytics init done"
};
win.addEventListener('open', function(evt) {
  GoogleAnalytics.sendReport("GoogleAnalytics init done");
});


win.open();
```

### 注意点

iPhoneSimulator上では問題ないのですが、実機（iPhone5+iOS7.1）だと以下の処理の所が実行されるタイイミングでアプリが落ちます。


```javascript
GoogleAnalytics.sendReport("GoogleAnalytics init done");
```

## License

The MIT License (MIT)
Copyright (c) 2014 Hiroshi Oyamada

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

