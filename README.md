MyWeatherApp
============

![](https://raw.github.com/raneksi/MyWeatherApp/gh-pages/myweatherapp.png)

Gets weather data from [openweathermap.org/API](http://openweathermap.org/API).

## TODO

* Add a "Last Updated" column.
* Show a loading indicator while doing a request.
* Keep locations in `UserDefaults`.
* Cache requests by location.
* Preferences for °C/°F.
* Could use bindings to keep UI up-to-date with models. Right now includes a lot of glue-code in `TableViewController` to update everything programmatically with `<NSTableViewDataSource>` & friends.