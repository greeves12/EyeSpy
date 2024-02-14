
<div align="center">

![Python 3.5](https://img.shields.io/badge/Python-3.6%2B-blue.svg)
![OS Linux](https://img.shields.io/badge/Supported%20OS-Linux-yellow.svg)
![Lets stalk](https://img.shields.io/badge/Stalkermode-Activated-red.svg)

</div>

---

<p align="center"> You have at least one image of the person you are looking for and a clue about their name. 
<br>
You enter this data into EyeSpy and it tries to find Instagram, Youtube, Facebook, and Twitter Profiles of this person.
    <br> 
</p>

## 📝 Table of Contents
- [Getting Started](#getting_started)
- [Usage](#usage)
- [Built Using](#built_using)
- [TODO](#todo)


## 🏁 Getting Started <a name = "getting_started"></a>
These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

- A system with a x-server installed (Linux)
- Firefox installed

#### When using docker
- Only docker is required

#### When you dont use docker
- Python 3.6 or higher
- Pythons pip


### Installing

#### Docker (Required)
**Make sure that you have docker installed**
**Make sure that you use a LINUX distribution as the host**
1. Clone the Repository

   ``` $ git clone https://github.com/greeves12/EyeSpy ```
2. ```
   $ cd EyeSpy
   $ sudo docker build -t eyespy .
   ```
3. Now create a `known` folder and a `result` folder anywhere on your PC.
4. Put the images of the known person in the known folder.
5. Change the name of the person your are searching for in `entry.sh`
6. Start the container. **Make sure to edit the paths**:
```
sudo docker run -t --net=host --env="DISPLAY" \
                           --volume="$HOME/.Xauthority:/root/.Xauthority:rw"  \
                           -v  /path/to/known:/EyeSpy/known \
                           -v  /path/to/result:/result \
                           -v /path/to/EyeSpy/Repository/entry.sh:/entry.sh \
                           eyespy

```

The result should now be in `/path/to/result`


If Firefox is installed, download the [latest release](https://github.com/mozilla/geckodriver/releases/latest) of the Geckodriver for you Architecture.

**If you get a `broken pipe` Error use Geckodriver Version 0.19.1.**

**Note: If you are using Firefox ESR (like Kali does) please use the Geckodriver Version 0.17.**

Make the Geckodriver executable:
```
$ chmod +x /path/to/geckodriver
```

Note: The `geckodriver` prefers to be in your path so wherever you do set it up you will likely need to setup a link to somewhere in your PATH (or add it to your PATH).

Example:
```
$ sudo ln -s /path/to/geckodriver /usr/local/bin/geckodriver
```


## 🎈 Usage <a name="usage"></a>

### Configuration: General

Change the value in `config.json` to the path of the `geckodriver` e.g
```
{
    "DEFAULTS": {
        ...
    },
    "WEBDRIVER": {
        "ENGINE": "firefox",
        "PATH": "/usr/local/bin/geckodriver"
    },
    "FILTER": [
        ....
    ],
    ...
}
```

### Configuration: Images

Put at least one Image of the Person you want to find in the `known` folder.

Supported Filetypes are: **jpg/JPG, jpeg/JPEG, png/PNG, and bmp/BMP.**

### Run

Then run the program ;)
```
$ python3 eyespy.py
```

To see a list of all available Options just type
```
$ python3 eyespy.py -h
```

*The ImageRaider Reverse Image Search can take some minutes 1-15 Minutes depending on the count of Images*


## TODO <a name = "todo"></a>
* Implement the Chrome Webdriver

## ⛏️ Built Using <a name = "built_using"></a>
- [Python](https://www.python.org/) - Language
- [dlib](http://dlib.net/) - Face detection
- [face_recognition](https://github.com/ageitgey/face_recognition) - dlib python api
- [Selenium](https://www.seleniumhq.org/) - WebBrowser automation
