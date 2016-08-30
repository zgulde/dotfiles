#!/usr/bin/env ruby

# this script will give us an overview of whatever directory we are in
# it will tell us the number of lines of code for each extension, as well as
# the number of files with that extension, and express both of these numbers as
# a percentage of the whole
#
# TODO: consolidate the call to `find` and `wc` into one and parse the output
#       this will greatly speed performance

source_code_extensions = %w(html css js php rb py)
ignores = %w(bootstrap jquery qwest vue vendor node_modules)

extensions_with_line_counts = source_code_extensions.map do |extension|
  num_lines = 0
  files = `find . -name '*.#{extension}'`
    .split("\n")
    .select { |file| not ignores.any? { |word| file.include? word } }
    .each { |file| num_lines += `wc -l #{file}`.to_i }
  {num_lines: num_lines, extension: extension, num_files: files.length}
end
  .sort {|x,y| y[:num_lines] <=> x[:num_lines]}
  .select {|ext| ext[:num_lines] > 0}

total_number_lines = extensions_with_line_counts.reduce(0) { |sum, curr| sum += curr[:num_lines] } 
total_number_files = extensions_with_line_counts.reduce(0) { |sum, curr| sum += curr[:num_files] } 

printf "%5s | %-8s | %6s | %8s | %s\n", 'ext', '  loc' , '% loc ', '# files', '% files'
printf "%5s | %-8s | %6s | %8s | %s\n", '---', '--------', '-----', '-------', '-------'

extensions_with_line_counts.each do |extension|
  percent_loc = (extension[:num_lines] / total_number_lines.to_f) * 100
  percent_files = (extension[:num_files] / total_number_files.to_f) * 100
  printf("%5s | %8d | %-5.2f%% | %8d | %.2f%%\n",
         extension[:extension],
         extension[:num_lines],
         percent_loc,
         extension[:num_files],
         percent_files)
end
