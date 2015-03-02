#Ionic Kickoff Seed
Ionic.io application boilerplate for Ng-Classify lovers

__based on:__ [angular-kickoff](https://github.com/marcelinhov2/angular-kickoff)

__inspirated in:__ [angular-hipster-seed](https://github.com/t3chnoboy/angular-hipster-seed)


##Features
* CLI to generate and destroy modules, styles and partials ( Contribution of: [viniciuszago](https://github.com/viniciuszago) );
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
git clone https://github.com/marcelinhov2/angular-kickoff.git
cd angular-kickoff
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

###CLI
Example of how to use the Command Line Interface of the seed:

__Options:__
```sh
angular-kickoff -h, --help                       # Output usage information
angular-kickoff -V, --version                    # Output the version number
angular-kickoff -g, --generate <option> [value]  # Generate files
angular-kickoff -d, --destroy <option> [value]   # Generate files
```

__Ng-Classify Modules Available (module_name):__ 

* ```animation```  https://github.com/CaryLandholt/ng-classify#animation
* ```config```     https://github.com/CaryLandholt/ng-classify#config
* ```constant```   https://github.com/CaryLandholt/ng-classify#constant
* ```controller``` https://github.com/CaryLandholt/ng-classify#controller 
* ```directive```  https://github.com/CaryLandholt/ng-classify#directive
* ```factory```    https://github.com/CaryLandholt/ng-classify#factory
* ```filter```     https://github.com/CaryLandholt/ng-classify#filter
* ```provider```   https://github.com/CaryLandholt/ng-classify#provider
* ```run```        https://github.com/CaryLandholt/ng-classify#run
* ```service```    https://github.com/CaryLandholt/ng-classify#service
* ```value```      https://github.com/CaryLandholt/ng-classify#value

__Examples:__ 
```sh
angular-kickoff -g module module_name/class_name   # create modules
angular-kickoff -g partial folder_name/name        # create partials
angular-kickoff -g style name                      # create styles
angular-kickoff -d module module_name/class_name   # destroy modules
angular-kickoff -d partial folder_name/name        # destroy partials
angular-kickoff -d style name                      # destroy styles
```

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
* Tests