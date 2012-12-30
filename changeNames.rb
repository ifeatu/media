#!/usr/bin/ruby

def monthToNum(month)
  month.downcase!
  case month
  when "jan"
    return '01'
  when "feb"
    return '02'
  when "march"
    return '03'
  when "mar"
    return '03'
  when "april"
    return '04'
  when "apr"
    return '04'
  when "may"
    return '05'
  when "june"
    return '06'
  when "july"
    return '07'
  when "jul"
    return '07'
  when "aug"
    return '08'  
  when "august"
    return '08'
  when "sept"
    return '09'
  when "oct"
    return '10'
  when "nov"
    return '11'
  when "dec"
    return '12'
  else
    return '13'
    
  end
end

def printTofile(name)
        #read new filenames into file.
        File.open('/Users/pierre/scripts/media/newNames.txt', 'a') do |f2|  
          # use "\n" for two lines of text
          f2.puts "#{name}"
        end
end


def getFilenames(path)
  years_pattern = "[12][0-9][0-9][0-9]"
  Dir.glob("#{path}/#{years_pattern}/") do |folder_names|
        Dir.glob("#{folder_names}*") do |name|
         
         #preserve file-path
         act_path = "#{folder_names}"
         
                            
          tape_name = name.split("/")
          #puts "The file name is #{tape_name[5]}" if File.file?(name)
          name_all = tape_name[5]
          #unless name =~ /^\.{1,}$/
            #puts "The file name is #{name}"

            #Split the file by period
            ext_temp = name_all.split(".")

            #Split the file by underscore
            words = ext_temp[0].split("_")

            #count the number of elements in array
            num_elements = words.count

            #find extension of the file
            extension = ext_temp[1]
            #puts "The extension of the file is: #{extension}"

            #get any other info available about the file.
            month, day, year, *rest = words
            etc = rest.join("_")
            etc = "noinfo" if etc.empty?
            month2 = monthToNum(month)


            year.split /^\d{4}$/
            
          if month2 != "13" && year =~ /^\d{4}$/
            new_name = "#{year}-#{month2}-#{day}-#{etc}.#{extension}"
            puts "The new file name is: #{new_name}"
            #puts "Are any of these location? #{etc}"
            printTofile(new_name)
            
            #Backup File Name
            myFile = File.new("backup.txt", "a")
            myFile.puts("#{new_name}\n")
            
            
            File.rename( "#{name}", "#{act_path}#{new_name}" )
            #confirm that there are no duplicates
          end
        end
   end
end



print "Where are your folders:[/Volumes/music/audio]"
inut = gets.chomp
if inut.empty?
 # path = "/Volumes/gac_repo/video"
 path = "/Volumes/music/audio"
else
  path = inut
end
getFilenames(path)

