# cordova-plugin-firebase-dynamiclinks<br>[![NPM version][npm-version]][npm-url] [![NPM downloads][npm-downloads]][npm-url]
> Cordova plugin for [Firebase Invites](https://firebase.google.com/docs/invites/) and [Firebase Dynamic Links](https://firebase.google.com/docs/dynamic-links/)
 
## Installation

    cordova plugin add cordova-plugin-firebase-dynamiclinks --save --variable APP_DOMAIN="example.com" --variable REVERSED_CLIENT_ID="123456789.com.example" --variable PHOTO_LIBRARY_USAGE_DESCRIPTION="Account images used to present invites dialog"

Variables `APP_DOMAIN` and `APP_PATH` specify web URL where your app will start an activity to handle the link.

Variable `REVERSED_CLIENT_ID` can be found in your `GoogleService-Info.plist` under the same key name.

Variable `PHOTO_LIBRARY_USAGE_DESCRIPTION` specifies required value for `NSPhotoLibraryUsageDescription` on iOS.

## Supported Platforms

- iOS
- Android

## Methods

### onDynamicLink(_callback_)
Registers callback that is triggered on each dynamic link click.
```js
window.cordova.plugins.firebase.dynamiclinks.onDynamicLink(function(data) {
    console.log("Dynamic link click with data: ", data);
});
```

### sendInvitation(_config_)
Display invitation dialog.
```js
window.cordova.plugins.firebase.dynamiclinks.sendInvitation({
    deepLink: deepLink,
    title: dialogTitle,
    message: dialogMessage,
    callToActionText: actionButtonText
});
```

[npm-url]: https://www.npmjs.com/package/cordova-plugin-firebase-dynamiclinks
[npm-version]: https://img.shields.io/npm/v/cordova-plugin-firebase-dynamiclinks.svg
[npm-downloads]: https://img.shields.io/npm/dt/cordova-plugin-firebase-dynamiclinks.svg

