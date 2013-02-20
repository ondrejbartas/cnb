#!/usr/bin/env ruby

require 'net/http'
require 'pathname'
require 'date'
require 'uri'

module CNB
  class Parser
    attr_reader :date 

    LOCAL_CURRENCY = 'CZK'
    CNB_LIST = "http://www.cnb.cz/cs/financni_trhy/devizovy_trh/kurzy_devizoveho_trhu/denni_kurz.txt"
  
    def initialize(date = Date.today)
      @request_date = date
      @date = nil
      @currencies = {}
    end
    
    def parse
      content = get_rates
    
      line_no = 0
    
      #EXAMPLE OF FILE
      #
      #1: 15.02.2013 #33
      #2: zeme|mena|mnozstvi|kod|kurz
      #3: Australie|dolar|1|AUD|19,683
      #4: Madarsko|forint|100|HUF|8,681


      content.each_line do |line|
        line_no += 1
      
        # process date (line #1)
        if line_no == 1
          @date = Date.strptime(line[0..9],"%d.%m.%Y")
          next
        end
      
        # skip line #2
        next if line_no == 2
      
        # process line
        items = line.split("|")
        
        #mnozstvi
        # it means 1czk = kurz/mnozstvi currency
        amount = items[2].gsub(',','.').to_f
        #kod
        currency = items[3]
        #kurz
        price = items[4].gsub(',','.').to_f
        

        @currencies[currency] = price/amount
      end
    end
  
    def rate(currency)
      @currencies[currency]
    end

    private
  
    def get_rates
      url_text = "%s?date=%s" % [CNB_LIST, @request_date.strftime('%d.%m.%Y')]
    
      url = URI.parse(url_text)
      the_request = Net::HTTP::Get.new(url.to_s)

      the_response = Net::HTTP.start(url.host, url.port) { |http|
        http.request(the_request)
      }

      raise "Response was not 200, response was #{the_response.code}" if the_response.code != "200"
      return the_response.body
    end
  end

end