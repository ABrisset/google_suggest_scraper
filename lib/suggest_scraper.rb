class SuggestScraper
  attr_accessor :query, :results

  def initialize(query, lang, geo)
    @query = query
    @lang = lang
    @geo = geo
    @results = []
  end

  def process
    query = url_encode(@query)
    suggestions = get_suggestions_from(query, @lang)
    suggestions.each_with_index do |s, i|
      begin
        @results.push(s) unless @results.include?(s)
        next_suggestion = suggestions[i+1]
        unless next_suggestion.nil?
          @query = next_suggestion
          next_suggestions = get_suggestions_from(url_encode(@query), @lang)
          process if next_suggestions.count > 1
        end
      rescue => e
        puts e
      end
    end
  end

  private
  def url_encode(string)
    CGI::escape(string)
  end

  def get_suggestions_from(query, lang)
    url = "https://www.google.com/complete/search?output=toolbar&hl=#{lang}&q=#{query}&gl=#{geo}&ie=utf-8"
    doc = open(url)
    xml = Nokogiri::XML(doc)
    suggestions = xml.xpath('//toplevel/CompleteSuggestion/suggestion/@data')
                     .map {|s| s.text }
    suggestions = suggestions
    return suggestions
  end
end
