# encoding: utf-8
require "bashim/version"
require 'net/http'
require 'iconv'

module Bashim
	def random
		html = Net::HTTP.get('bash.im', '/random')
		html.encode!('UTF-8', 'CP1251', :invalid => :replace, :replace => '')
		text = /\<div class=\"text\"\>.*?\<\/div\>/.match(html)
		cit = text.to_s
		cit.gsub!(/\<br.*?\>/,"\n")
		cit.gsub!(/&quot;/,"\"")
		cit.gsub!(/&lt;/,"<")
		cit.gsub!(/&gt;/,">")
		return cit.gsub(/\<.+?\>/,"")
	end
end
