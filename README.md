Gnome Random Background
=======================

## Requirements

* Gnome (duh)
* curl
* jq

## How to use

Run this command

```
$ ./gnome-random-background.sh
```

And you should see a new random background.

## Change periodically

Run this command

```
$ crontab -e
```

And add this line at the end

```
0 * * * * pathtorepo/gnome-random-background.sh
```

Where `pathtorepo` is the path to the folder that you cloned.

## Credits

[unsplash](https://unsplash.com)
