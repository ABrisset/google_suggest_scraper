# Google Suggest Scraper

A Ruby command line to tool to scrape Google Suggest

## Installation

Clone the repo or [download zip file](https://github.com/ABrisset/suggest_scrapper/archive/master.zip), use it locally or upload it to whatever hosting you want.

## Server Requirements

- Ruby 2.4.0
- Nokogiri

## Usage

Install the Nokogiri ruby gem via Bundler using `bundle install`. Then, just run :

```console
ruby scraper.rb [options]
```

Options :
- -q : keyword ("iphone" for example)
- -l : language ("fr", "en", etc.)
- -g : location ("FR", "DE", etc.)

Enter a keyword and, optionaly, a language ("fr" is the default language) and/or a country ("FR" is the defaut location). The tool will fetch all suggestions from Google Suggest and store them in a plan text file.

## License

Google Suggest Scraper is open-sourced software licensed under the [MIT license](https://opensource.org/licenses/MIT).