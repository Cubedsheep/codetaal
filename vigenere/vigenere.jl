# This file contains functions related to the vigenere cipher

# import modules

# function to add two characters. only textual characters can be added
function add_chars(char1::Char, char2::Char)
    """
    adds the two characters together if they are both alfabethical.
        The capitalisation of the first character is kept.
        If one of the characters is not alfabethical, the first character
        is returned.
    """
    # initialise the result
    result = char1
    # add them together if they are alfabethical
    if isletter(char1) & isletter(char2)
        letter_num = ((Int(lowercase(char1))-Int('a')) + (Int(lowercase(char2))-Int('a'))) % 26;
        if islowercase(char1)
            result = 'a' + letter_num;
        else result = 'A' + letter_num;
        end
    end
    return result
end

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
