#!/usr/bin/ruby
#encoding: utf-8

require 'gruff'
require_relative 'error/error.class.rb'
require_relative '108monstre.class.rb'

def main
  s = ARGV.size
  v = Gruff::Line.new ("1000x1000")
  v.title = '108monstre'

  if s != 2
    Error::call "error : you need two argument"
  end
  if (Error::isnum? ARGV[0]) == false || (Error::isnum? ARGV[1]) == false
    Error::call "error : number invalide"
  end
  g = Monster.new ARGV[0].to_f, ARGV[1].to_f
  h = g.calc
  

  v.labels = { 0 => '-2', h.size / 8 => '-1.5',
    h.size / 8 * 2 => '-1', h.size / 8 * 3 => '-0.5',
    h.size / 2 => '0', h.size / 8 * 5 => '0.5',
    h.size / 8 * 6 => '1', h.size / 8 * 7 => '1.5',
    h.size - 1 => '2' }
  v.data :"courbe monster", h
  
  v.write('108monstre.png')
  `eog 108monstre.png`
end

main()
