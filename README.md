#Ionic Kickoff Seed
Ionic.io application boilerplate for Ng-Classify lovers

__based on:__ [angular-kickoff](https://github.com/marcelinhov2/angular-kickoff)

__inspirated in:__ [angular-hipster-seed](https://github.com/t3chnoboy/angular-hipster-seed)


##Features
* Auto create/delete of src files inside app folder;
* Jade instead of html;
* Coffee-Script instead of JS;
* Ng-Classify for better AngularJs Declarations;
* Stylus instead of css;
* Template Cache;
* Automatic compilation;
* Livereload without any plugins;
* Production build with optimizations;
* Automatic bower components injection;
* Automatic scripts and stylesheets injection.

##Installation

Clone repo using git
```sh
git clone https://github.com/marcelinhov2/ionic-kickoff.git
cd ionic-kickoff
```
Install some packages
```sh
npm install -g ionic cordova bower ios-sim
```
Erase remote
```sh
make remove_remote
```
Install dependencies
```sh
make setup
```

##Usage

###Clean remote
This command automatically erase the .git folder.
```sh
make remove_remote
```

###Running the App during Development
This command automatically compiles coffee, jade and stylus, injects bower components, generates source maps, starts livereload server and opens your app in the browser.
```sh
make server
```

###Compiling app for development
This command compiles project and generates source maps. Output goes to ```sh app/``` folder
```
make compile
```

###Building the App for Production
This command compiles project and optimizes it for production. Output goes to ```sh dist/``` folder
```
make build
```

##Emulators Installation

###IOS SIMULATOR ( Only for Mac users )
```sh
ionic emulate IOS
```

####Tips
If got an error on IOS try to reset the simulator:

iOS Simulator -> Reset Contents and Settings... -> Reset

###Android Simulator ( I just did it at Mac Os )

* Install Android Studio and SDK Tools

* Install VirtualBox 

* Install Genymotion ( you will need to register )

```sh
  npm install shelljs q which
```

* You will need to export android bin your path

	```sh
    export ANDROID_HOME="/Users/<user_name>/Library/Android/sdk"
    export ANDROID_TOOLS="/Users/<user_name>/Library/Android/sdk/tools/"
    export ANDROID_PLATFORM_TOOLS="/Users/<user_name>/Library/Android/sdk/platform-tools/"
    PATH=$PATH:$ANDROID_HOME:$ANDROID_TOOLS:$ANDROID_PLATFORM_TOOLS
  ```

```sh
  brew install ant
```

* Open your android emulator machine

```sh
  ionic run android
```


##Directory layout

### Source

```sh
ionic-kickoff
└── src
    ├── fonts
    ├── images
    ├── partials
    │   ├── directives
    │   └── views
    ├── scripts
    │   ├── configs
    │   ├── constants
    │   ├── controllers
    │   │   ├── directives
    │   │   └── views
    │   ├── directives
    │   ├── factories
    │   ├── filters
    │   ├── providers
    │   ├── runs
    │   ├── services
    │   │   ├── api
    │   │   └── utils
    │   └── values
    └── styles
```

##TODO's
* Prerender.io