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

Const_parseJSON = "- (void)parseJSON:(NSDictionary *)dict {"
Const_close     = "}"
Const_selfDot   = "self."
Const_tab       = "     ";
Const_equal     = " = ";
Const_dictLeft  = "dict[@\""
Const_dictRight = "\"]"
Const_squareBracketLeft = "["
Const_squareBracketRight = "]"
Const_booleanValue = " boolValue"

Const_importFoundation = "#import <Foundation/Foundation.h>"
Const_interface = "@interface "
Const_semicolon = " : NSObject"
Const_end = "@end"

json_file_path = ARGV[0]
json_root_class_name = ARGV[1]
class_property_name_map = {}
class_name_code_map = {}

def parse(hash, propertiesDeclaration, parseJSONMethods)
    hash.each do |key, value|
        # puts key, value
        if value.is_a?(Hash)
            # parse(value)
            propertiesDeclaration << Const_property + Const_strong + Const_dictionary + key + Const_comma
            parseJSONMethods << Const_tab + Const_selfDot + key + Const_equal + Const_dictLeft + key + Const_dictRight + Const_comma
            hash_key_join = value.keys.sort.join
            if class_map[hash_key_join] == nil
                class_name = json_root_class_name + key.capitalize
                class_map[hash_key_join] = class_name
                class_code_declaration = []
                class_code_declaration << Const_importFoundation
                class_code_declaration << Const_interface + class_name + Const_semicolon
                # change to class to solve problem
                class_name_code_map[class_name] = class_code_declaration
            end
        elsif value.is_a?(Array)
            propertiesDeclaration << Const_property + Const_strong + Const_array + key + Const_comma
            parseJSONMethods << Const_tab + Const_selfDot + key + Const_equal + Const_dictLeft + key + Const_dictRight + Const_comma
        elsif value.is_a?(Numeric)
            propertiesDeclaration << Const_property + Const_strong + Const_number + key + Const_comma
            parseJSONMethods << Const_tab + Const_selfDot + key + Const_equal + Const_dictLeft + key + Const_dictRight + Const_comma
        elsif value.is_a?(String)
            propertiesDeclaration << Const_property + Const_strong + Const_string + key + Const_comma
            parseJSONMethods << Const_tab + Const_selfDot + key + Const_equal + Const_dictLeft + key + Const_dictRight + Const_comma
        elsif (value.is_a?(TrueClass) || value.is_a?(FalseClass))
            propertiesDeclaration << Const_property + Const_assign + Const_boolean + key + Const_comma
            parseJSONMethods << Const_tab + Const_selfDot + key + Const_equal + Const_squareBracketLeft + Const_dictLeft + key + Const_dictRight + Const_booleanValue + Const_squareBracketRight + Const_comma
        else
            puts "undefined"
        end
    end
end

json_string = File.readlines(json_file_path).join
json_object = JSON.parse(json_string)
json_to_properties_result = []
json_to_parse_method = []
json_to_parse_method << Const_parseJSON
parse(json_object, json_to_properties_result, json_to_parse_method)
json_to_parse_method << Const_close
puts json_to_properties_result
puts json_to_parse_method
