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
