require "bashim/version"
require 'net/http'
require 'iconv'

module Bashim

	html = Net::HTTP.get('bash.im', '/random')
	html = Iconv.conv("UTF8//IGNORE//TRANSLIT", "CP1251", html)
	text = /\<div class=\"text\"\>.*?\<\/div\>/.match(html)
	cit = text.to_s
	cit.gsub!(/\<br.*?\>/,"\n")
	cit.gsub!(/&quot;/,"\"")
	cit.gsub!(/&lt;/,"<")
	cit.gsub!(/&gt;/,">")
	puts "\033[33m"
	puts cit.gsub(/\<.+?\>/,"")
	puts "\033[37m"

end
