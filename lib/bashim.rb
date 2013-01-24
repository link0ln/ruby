# encoding: utf-8
require "bashim/version"
require 'net/http'
require 'iconv'

module Bashim
	def random
		html = Net::HTTP.get('bash.im', '/random')
		html = html.encode Encoding::UTF_8, :undef => :replace
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
end
