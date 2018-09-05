#! /usr/local/bin/ruby

require 'json'

Const_property  = "@property (nonatomic, "
Const_strong    = "strong) "
Const_assign    = "assign) " 
Cosnt_copy      = "copy) "

Const_string    = "NSString *"
Const_number    = "NSNumber *"
Const_dictionary= "NSDictionary *"
Const_array     = "NSArray *"
Const_boolean   = "BOOL "
Const_comma     = ";"


def parse(hash, result)
    hash.each do |key, value|
        # puts key, value
        if value.is_a?(Hash)
            # parse(value)
            result << Const_property + Const_strong + Const_dictionary + key + Const_comma;
        elsif value.is_a?(Array)
            result << Const_property + Const_strong + Const_array + key + Const_comma;
        elsif value.is_a?(Numeric)
            result << Const_property + Const_strong + Const_number + key + Const_comma;
        elsif value.is_a?(String)
            result << Const_property + Const_strong + Const_string + key + Const_comma;
        elsif (value.is_a?(TrueClass) || value.is_a?(FalseClass))
            result << Const_property + Const_assign + Const_boolean + key + Const_comma;
        else
            puts "undefined"
        end
    end
end

json_file_path = ARGV[0]
json_string = File.readlines(json_file_path).join
json_object = JSON.parse(json_string)
json_to_properties_result = []
parse(json_object, json_to_properties_result)
puts json_to_properties_result
