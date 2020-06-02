# This file contains functions related to the vigenere cipher

# import modules
include("../caesar/caesar.jl") # we need the add_chars function

# function to encrypt a text using the vigenere cipher
function vigenere_encrypt(text::String, key::String)
# initialise variables
    result = Array{Char,1}();
    key_length = length(key);
    key_index = 1;

    # iterate over the string and add every letter with the corresponding
    # letter from the key
    for char in text
        if isletter(char)
            push!(result, add_chars(char, key[1+(key_index-1)%key_length]));
            key_index += 1;
        else
            push!(result, char);
        end
    end
    # link all characters into a string and return it
    return join(result)
end


# function to decrypt a text
function vigenere_decrypt(text::String, key::String)
    # get the "inverse" key
    chars = Array{Char,1}();
    for char in key
        num = Int(lowercase(char))-Int('a');
        push!(chars, 'a'+(26-num)%26);
    end
    decrypt_key = join(chars);
    # decrypt by "encrypting" the encrypted string with the invers key
    return vigenere_encrypt(text, decrypt_key);
end
