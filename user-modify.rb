#!/usr/local/rvm/rubies/ruby-2.0.0-p648/bin/ruby

require_relative 'config/environment'

kw = ARGV[0]
pw = ARGV[1]

if pw.nil?
  puts usage: "./user-modify.rb <username> <new password>\n"
  exit
end

u = User.where(["email LIKE ?","%#{kw}%"])[0]
u.password = pw
u.password_confirmation = pw
u.save
