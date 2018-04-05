# Run Selenium/Chrome-Standalone with Plugins

If you want to run plugins in selenium - chrome you have to transfer your plugins from an api client, to the selenium container.
You don't always want to use that, because you have to transfer the plugins with every session you are running.

To avoid the transfert you can build the plugin directly into the selenium container. 

I provided a Dockerfile on how to easily do this. Just put the .crx-file into the `extensions/original-extension-files` folder and run a docker build.
The extension will be extracted to a folder `extensions/extracted-extensions` folder.

In this repo you find some examples like ublock origin.

## usage

Instead of the loadPlugin function of your driver you can now just use the AddArgument function.

```
options.AddArgument("--load-extensions=/data/extensions/disable-html5-autoplay,/data/extensions/fast-image-blocker,/data/extensions/flash-block-plus,/data/extensions/ublock-origin");
```
