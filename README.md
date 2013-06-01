# Chrome extension packaging
Quick bash script I made for myself, to pack up Google Chrome extensions from git repos using git tags. May be useful to anyone else.

## Install
Clone this repo using <code>git clone git://github.com/rafaqueque/chrome-ext-packaging</code> and you're done.

## Usage 
    sh package.sh [output_dir]
You need to be in your repository in order for this to work properly. Also, 
## Options
The <code>output_dir</code> is optional. If you don't specify, it will use the current dir.

## Examples
    cd gmail-checker-lite
    sh ../chrome-ext-packaging/package.sh ~/Desktop

Output will be something like:
![Demo](https://dl.dropboxusercontent.com/u/869340/chrome-ext-packaging-demo.png)
On this demo, my repo is on version 0.0.2, so it will generate the latest build available.

## Notes
* This will lookup for <code>git tag</code>, so it works better if you use that feature.
* If you have pending changes to commit, the script will abort and exit. 

## About
You can ping me on Twitter ([@rafaqueque](http://twitter.com/rafaqueque)) or check my homepage: [rafael.pt](http://rafael.pt)