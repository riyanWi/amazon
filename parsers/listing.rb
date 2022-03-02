html = Nokogiri.HTML(content)

products = html.xpath("//div[starts-with(@cel_widget_id, 'MAIN-SEARCH_RESULTS')]")


products.each do |product|
    url_elem = html.at_css('.a-link-normal.s-underline-text.s-underline-link-text.a-text-normal')['href']
    url_regex = url_elem.gsub(/\/ref=.*$/, '')
    url =  "https://www.amazon.com#{url_regex}"

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

page_links = html.css('.s-pagination-container a')

page_links.each do |link|
    url_element = link['href']
    if url_element
        url =  "https://www.amazon.com#{url_element}"
        pages << {
            page_type: "listings",
            method: "GET",
            headers: {"User-Agent" => "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/71.0.3578.98 Safari/537.36"},
            url: url,
            vars: {
                category: page['vars']['category']
            }
        }
    end
end


    

