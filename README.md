# Google Suggests Scraper

A Ruby command line to tool to scrape Google Suggests

## Installation

Clone the repo or [download zip file](https://github.com/ABrisset/suggest_scrapper/archive/master.zip), use it locally or upload it to whatever hosting you want.

## Server Requirements

- Ruby 2.4.0

## Usage
```console
ruby scraper.rb [options]
```

Options :
- -q : keyword ("iphone" for example)
- -l : language ("fr", "en", etc.)

Enter a keyword and, optionaly, a language ("fr" is the default language). The tool will fetch all suggestions from Google Suggests and store them in a plan text file.

## License

Google Suggests Scraper is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).