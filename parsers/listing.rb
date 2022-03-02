html = Nokogiri.HTML(content)

products = html.css('._octopus-search-result-card_style_apbSearchResultItem__2-mx4')

products.each do |product|
    url_elem = html.at_css('.a-link-normal.s-underline-text.s-underline-link-text.a-text-normal')['href']
    url_regex = url_elem.gsub(/\/ref=.*$/, '')
    url =  "https://www.amazon.com/#{url_regex}"

    pages << {
        url: url,
        page_type: "products",
        method: "GET",
        headers: {"User-Agent" => "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36"},
        vars: {
            category: page['vars']['category'],
        }
    }

end