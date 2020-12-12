# frozen_string_literal: true

require 'csv'
require 'google/apis/civicinfo_v2'
require 'erb'

def clean_phonenumber(phone)
  phone = phone.scan(/\d/).join
  return 'Wrong number' unless phone.length == 10 || phone[-11] == '1'

  "(#{phone[-10..-8]}) #{phone[-7..-5]}-#{phone[-4..-1]}"
end

def clean_zipcode(zipcode)
  zipcode = zipcode.to_s.rjust(5, '0')[0..4]
end

def sort_by_frecuency(array)
  array.each_with_object(Hash.new(0)) { |hour, hash| hash[hour] += 1; }
       .sort_by { |_k, v| v }.reverse
       .map { |k, v| v > 1 ? "#{k} => #{v} times" : "#{k} => #{v} time" }
end

# def legislators_by_zipcode(zip)
#   civic_info = Google::Apis::CivicinfoV2::CivicInfoService.new
#   civic_info.key = 'AIzaSyClRzDqDh5MsXwnCWi0kOiiBivP6JsSyBw'

#   begin
#     civic_info.representative_info_by_address(
#       address: zip,
#       levels: 'country',
#       roles: ['legislatorUpperBody', 'legislatorLowerBody']
#     ).officials

#   rescue
#     'You can find your representatives by visiting www.commoncause.org/take-action/find-elected-officials'
#   end
# end

# def save_letter(id, form_letter)
#   Dir.mkdir("output") unless Dir.exist? "output"
#   filename = "output/thank_you_#{id}.html"

#   File.open(filename, 'w') do |file|
#     file.puts form_letter
#   end
# end

# template_letter = File.read 'form_letter.erb'
# erb_template = ERB.new template_letter

content = CSV.open 'event_attendees.csv', headers: true, header_converters: :symbol
hours = []
weekdays = []

File.open('personal_data.txt', 'w+') do |file|
  file.puts
  file.puts '*** PERSONAL DATA ***'
  content.each do |row|
    id = row[0]
    name = row[:first_name]
    zipcode = clean_zipcode(row[:zipcode])
    phonenumber = clean_phonenumber(row[:homephone])
    file.puts "#{id}\t#{name}\t\t#{zipcode}\t#{phonenumber}"

    reg_date = DateTime.strptime(row[:regdate], '%m/%d/%y %H:%M')
    hours << reg_date.strftime('%H:00')
    weekdays << reg_date.strftime('%A')

    # legislators = legislators_by_zipcode(zipcode)
    # form_letter = erb_template.result(binding)
    # save_letter(id, form_letter)
  end
end

File.open('personal_data.txt', 'a') do |file|
  file.puts
  file.puts '*** REGISTRATION DATA ***'
  file.puts sort_by_frecuency(hours)
  file.puts sort_by_frecuency(weekdays)
end
